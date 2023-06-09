
#include "include/types.h"
#include "include/param.h"
#include "include/memlayout.h"
#include "include/riscv.h"
#include "include/spinlock.h"
#include "include/proc.h"
#include "include/intr.h"
#include "include/kalloc.h"
#include "include/printf.h"
#include "include/string.h"
#include "include/fat32.h"
#include "include/file.h"
#include "include/trap.h"
#include "include/vm.h"

struct cpu cpus[NCPU];

struct proc proc[NPROC];

struct proc *initproc;

int nextpid = 1;
struct spinlock pid_lock;

extern void forkret(void);
extern void swtch(struct context *, struct context *);
static void wakeup1(struct proc *chan);
static void freeproc(struct proc *p);

extern char trampoline[]; // trampoline.S

void reg_info(void)
{
  printf("register info: {\n");
  printf("sstatus: %p\n", r_sstatus());
  printf("sip: %p\n", r_sip());
  printf("sie: %p\n", r_sie());
  printf("sepc: %p\n", r_sepc());
  printf("stvec: %p\n", r_stvec());
  printf("satp: %p\n", r_satp());
  printf("scause: %p\n", r_scause());
  printf("stval: %p\n", r_stval());
  printf("sp: %p\n", r_sp());
  printf("tp: %p\n", r_tp());
  printf("ra: %p\n", r_ra());
  printf("}\n");
}

// initialize the proc table at boot time.
void procinit(void)
{
  struct proc *p;

  initlock(&pid_lock, "nextpid");
  for (p = proc; p < &proc[NPROC]; p++)
  {
    initlock(&p->lock, "proc");

    // Allocate a page for the process's kernel stack.
    // Map it high in memory, followed by an invalid
    // guard page.
    // char *pa = kalloc();
    // // printf("[procinit]kernel stack: %p\n", (uint64)pa);
    // if(pa == 0)
    //   panic("kalloc");
    // uint64 va = KSTACK((int) (p - proc));
    // // printf("[procinit]kvmmap va %p to pa %p\n", va, (uint64)pa);
    // kvmmap(va, (uint64)pa, PGSIZE, PTE_R | PTE_W);
    // p->kstack = va;
  }
  // kvminithart();
  
  memset(cpus, 0, sizeof(cpus));
#ifdef DEBUG
  printf("procinit\n");
#endif
}

// Must be called with interrupts disabled,
// to prevent race with process being moved
// to a different CPU.
int cpuid()
{
  int id = r_tp();
  return id;
}

// Return this CPU's cpu struct.
// Interrupts must be disabled.
struct cpu *
mycpu(void)
{
  int id = cpuid();
  struct cpu *c = &cpus[id];

  return c;
}

// Return the current struct proc *, or zero if none.
struct proc *
myproc(void)
{
  push_off();
  struct cpu *c = mycpu();
  struct proc *p = c->proc;
  pop_off();
  return p;
}

int allocpid()
{
  int pid;

  acquire(&pid_lock);
  pid = nextpid;
  nextpid = nextpid + 1;
  release(&pid_lock);

  return pid;
}

// Look in the process table for an UNUSED proc.
// If found, initialize state required to run in the kernel,
// and return with p->lock held.
// If there are no free procs, or a memory allocation fails, return 0.
static struct proc *
allocproc(void)
{
  struct proc *p;

  for (p = proc; p < &proc[NPROC]; p++)
  {
    acquire(&p->lock);
    if (p->state == UNUSED)
    {
      goto found;
    }
    else
    {
      release(&p->lock);
    }
  }
  return NULL;

found:
  p->pid = allocpid();

  // Allocate a trapframe page.
  if ((p->trapframe = (struct trapframe *)kalloc()) == NULL)
  {
    release(&p->lock);
    return NULL;
  }

  // An empty user page table.
  // And an identical kernel page table for this proc.
  if ((p->pagetable = proc_pagetable(p)) == NULL ||
      (p->kpagetable = proc_kpagetable()) == NULL)
  {
    freeproc(p);
    release(&p->lock);
    return NULL;
  }

  p->kstack = VKSTACK;

  // Set up new context to start executing at forkret,
  // which returns to user space.
  memset(&p->context, 0, sizeof(p->context));
  p->context.ra = (uint64)forkret;
  p->context.sp = p->kstack + PGSIZE;

  // added by lmq for SYS_mmap
  for(int i=0;i<VMA_MAX;i++)
  {
    p->vma[i].valid=0;
    p->vma[i].mapcnt=0;
  }
  p->maxaddr=MAXVA-3*PGSIZE;
  return p;
}

// free a proc structure and the data hanging from it,
// including user pages.
// p->lock must be held.
static void
freeproc(struct proc *p)
{
  if (p->trapframe)
    kfree((void *)p->trapframe);
  p->trapframe = 0;
  if (p->kpagetable)
  {
    kvmfree(p->kpagetable, 1);
  }
  p->kpagetable = 0;
  if (p->pagetable)
    proc_freepagetable(p->pagetable, p->sz);
  p->pagetable = 0;
  p->sz = 0;
  p->pid = 0;
  p->parent = 0;
  p->name[0] = 0;
  p->chan = 0;
  p->killed = 0;
  p->xstate = 0;
  p->state = UNUSED;
}

// Create a user page table for a given process,
// with no user memory, but with trampoline pages.
pagetable_t
proc_pagetable(struct proc *p)
{
  pagetable_t pagetable;

  // An empty page table.
  pagetable = uvmcreate();
  if (pagetable == 0)
    return NULL;

  // map the trampoline code (for system call return)
  // at the highest user virtual address.
  // only the supervisor uses it, on the way
  // to/from user space, so not PTE_U.
  if (mappages(pagetable, TRAMPOLINE, PGSIZE,
               (uint64)trampoline, PTE_R | PTE_X) < 0)
  {
    uvmfree(pagetable, 0);
    return NULL;
  }

  // map the trapframe just below TRAMPOLINE, for trampoline.S.
  if (mappages(pagetable, TRAPFRAME, PGSIZE,
               (uint64)(p->trapframe), PTE_R | PTE_W) < 0)
  {
    vmunmap(pagetable, TRAMPOLINE, 1, 0);
    uvmfree(pagetable, 0);
    return NULL;
  }

  return pagetable;
}

// Free a process's page table, and free the
// physical memory it refers to.
void proc_freepagetable(pagetable_t pagetable, uint64 sz)
{
  vmunmap(pagetable, TRAMPOLINE, 1, 0);
  vmunmap(pagetable, TRAPFRAME, 1, 0);
  uvmfree(pagetable, sz);
}
// added by lmq for running sdcard.img
#ifndef TEST
uchar initcode[]={
0x13, 0x05, 0x20, 0x00, 0x93, 0x05, 0x10, 0x00, 0x93, 0x06, 0x00, 0x00, 0x93, 0x08, 0xa0, 0x00,
0x73, 0x00, 0x00, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x70, 0x01, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x70, 0x01, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0xc5, 0x7e,
0x97, 0x15, 0x00, 0x00, 0x93, 0x85, 0xe5, 0x8e, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0x25, 0x7b,
0x97, 0x15, 0x00, 0x00, 0x93, 0x85, 0xe5, 0x8b, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0xa5, 0x77,
0x97, 0x15, 0x00, 0x00, 0x93, 0x85, 0x65, 0x88, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0x25, 0x74,
0x97, 0x15, 0x00, 0x00, 0x93, 0x85, 0xe5, 0x84, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0xa5, 0x70,
0x97, 0x15, 0x00, 0x00, 0x93, 0x85, 0x65, 0x81, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0x05, 0x6d,
0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0xe5, 0x7d, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0x75, 0x69,
0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0x65, 0x7a, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0x05, 0x66,
0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0xe5, 0x76, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0x75, 0x62,
0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0x65, 0x73, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0xe5, 0x5e,
0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0xe5, 0x6f, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0x65, 0x5b,
0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0x65, 0x6c, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0xf5, 0x57,
0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0xe5, 0x68, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0xa5, 0x54,
0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0x65, 0x65, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0x35, 0x51,
0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0xe5, 0x61, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0xd5, 0x4d,
0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0x65, 0x5e, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0xc5, 0x4a,
0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0xe5, 0x5a, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0x55, 0x47,
0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0xe5, 0x58, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0xc5, 0x43,
0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0x65, 0x55, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0x55, 0x40,
0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0xe5, 0x51, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0xc5, 0x3c,
0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0x65, 0x4e, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0x35, 0x39,
0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0xe5, 0x4a, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0xb5, 0x35,
0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0x65, 0x47, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0x35, 0x32,
0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0x65, 0x44, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0xb5, 0x2e,
0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0xe5, 0x40, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0x45, 0x2b,
0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0x65, 0x3d, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0xb5, 0x27,
0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0xe5, 0x39, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0x55, 0x24,
0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0x65, 0x36, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0xd5, 0x20,
0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0xe5, 0x32, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0x65, 0x1e,
0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0x65, 0x27, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0xd5, 0x1a,
0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0x65, 0x24, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0x55, 0x15,
0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0xe5, 0x1f, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x10, 0x00,
0x73, 0x00, 0x00, 0x00, 0x63, 0x0a, 0x05, 0x00, 0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0x30, 0x00,
0x73, 0x00, 0x00, 0x00, 0xef, 0x00, 0x80, 0x02, 0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0xd5, 0x11,
0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0xe5, 0x1f, 0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
0x13, 0x05, 0x00, 0x00, 0x93, 0x08, 0xd0, 0x05, 0x73, 0x00, 0x00, 0x00, 0x93, 0x08, 0x20, 0x0d,
0x73, 0x00, 0x00, 0x00, 0x2f, 0x62, 0x72, 0x6b, 0x00, 0x00, 0x2f, 0x63, 0x68, 0x64, 0x69, 0x72,
0x00, 0x00, 0x2f, 0x63, 0x6c, 0x6f, 0x6e, 0x65, 0x00, 0x00, 0x2f, 0x63, 0x6c, 0x6f, 0x73, 0x65,
0x00, 0x00, 0x2f, 0x64, 0x75, 0x70, 0x00, 0x00, 0x2f, 0x64, 0x75, 0x70, 0x32, 0x00, 0x00, 0x2f,
0x65, 0x78, 0x65, 0x63, 0x76, 0x65, 0x00, 0x00, 0x2f, 0x65, 0x78, 0x69, 0x74, 0x00, 0x00, 0x2f,
0x66, 0x6f, 0x72, 0x6b, 0x00, 0x00, 0x2f, 0x66, 0x73, 0x74, 0x61, 0x74, 0x00, 0x00, 0x2f, 0x67,
0x65, 0x74, 0x63, 0x77, 0x64, 0x00, 0x00, 0x2f, 0x67, 0x65, 0x74, 0x64, 0x65, 0x6e, 0x74, 0x73,
0x00, 0x00, 0x2f, 0x67, 0x65, 0x74, 0x70, 0x69, 0x64, 0x00, 0x00, 0x2f, 0x67, 0x65, 0x74, 0x70,
0x70, 0x69, 0x64, 0x00, 0x00, 0x2f, 0x67, 0x65, 0x74, 0x74, 0x69, 0x6d, 0x65, 0x6f, 0x66, 0x64,
0x61, 0x79, 0x00, 0x00, 0x2f, 0x6d, 0x6b, 0x64, 0x69, 0x72, 0x5f, 0x00, 0x00, 0x2f, 0x6f, 0x70,
0x65, 0x6e, 0x00, 0x00, 0x2f, 0x6f, 0x70, 0x65, 0x6e, 0x61, 0x74, 0x00, 0x00, 0x2f, 0x70, 0x69,
0x70, 0x65, 0x00, 0x00, 0x2f, 0x72, 0x65, 0x61, 0x64, 0x00, 0x00, 0x2f, 0x73, 0x6c, 0x65, 0x65,
0x70, 0x00, 0x00, 0x2f, 0x74, 0x69, 0x6d, 0x65, 0x73, 0x00, 0x00, 0x2f, 0x75, 0x6e, 0x61, 0x6d,
0x65, 0x00, 0x00, 0x2f, 0x75, 0x6e, 0x6c, 0x69, 0x6e, 0x6b, 0x00, 0x00, 0x2f, 0x77, 0x61, 0x69,
0x74, 0x00, 0x00, 0x2f, 0x77, 0x61, 0x69, 0x74, 0x70, 0x69, 0x64, 0x00, 0x00, 0x2f, 0x77, 0x72,
0x69, 0x74, 0x65, 0x00, 0x00, 0x2f, 0x79, 0x69, 0x65, 0x6c, 0x64, 0x00, 0x00, 0x2f, 0x6d, 0x6f,
0x75, 0x6e, 0x74, 0x00, 0x00, 0x2f, 0x75, 0x6d, 0x6f, 0x75, 0x6e, 0x74, 0x00, 0x00, 0x2f, 0x6d,
0x6d, 0x61, 0x70, 0x00, 0x00, 0x2f, 0x6d, 0x75, 0x6e, 0x6d, 0x61, 0x70, 0x00, 0x00, 0x34, 0x08,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3a, 0x08,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x42, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x4a, 0x08,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x52, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x58, 0x08,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x5f, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x68, 0x08,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x6f, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x76, 0x08,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7e, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x87, 0x08,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x92, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x9b, 0x08,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xa5, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xb4, 0x08,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2e, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1d, 0x09,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x35, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xbd, 0x08,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xc4, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xcd, 0x08,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xd4, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xdb, 0x08,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xe3, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x25, 0x09,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xeb, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf3, 0x08,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xfc, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x09,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0d, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x15, 0x09,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
};
#endif
// a user program that calls exec("/init")
// od -t xC initcode
#ifdef TEST
// 运行终端
uchar initcode[] = {
    0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0x45, 0x02,
    0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0x35, 0x02,
    0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
    0x93, 0x08, 0x20, 0x00, 0x73, 0x00, 0x00, 0x00,
    0xef, 0xf0, 0x9f, 0xff, 0x2f, 0x69, 0x6e, 0x69,
    0x74, 0x00, 0x00, 0x24, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00};


#endif
// uchar initcode[] = {
//     0x13, 0x00, 0x00, 0x00,     // nop
//     0x13, 0x00, 0x00, 0x00,     // nop
//     0x13, 0x00, 0x00, 0x00,     // nop
//     // <start>
//     0x17, 0x05, 0x00, 0x00,     // auipc a0, 0x0
//     0x13, 0x05, 0x05, 0x00,     // mv a0, a0
//     0x93, 0x08, 0x60, 0x01,     // li a7, 22
//     0x73, 0x00, 0x00, 0x00,     // ecall
//     0xef, 0xf0, 0x1f, 0xff,     // jal ra, <start>
//     // <loop>
//     0xef, 0x00, 0x00, 0x00,     // jal ra, <loop>
// };

// void test_proc_init(int proc_num) {
//   if(proc_num > NPROC) panic("test_proc_init\n");
//   struct proc *p;
//   for(int i = 0; i < proc_num; i++) {
//     p = allocproc();
//     uvminit(p->pagetable, (uchar*)printhello, sizeof(printhello));
//     p->sz = PGSIZE;
//     p->trapframe->epc = 0x0;
//     p->trapframe->sp = PGSIZE;
//     safestrcpy(p->name, "test_code", sizeof(p->name));
//     p->state = RUNNABLE;
//     release(&p->lock);
//   }
//   initproc = proc;
//   printf("[test_proc]test_proc init done\n");
// }

// Set up first user process.
void userinit(void)
{
  struct proc *p;

  p = allocproc();
  initproc = p;

  // allocate one user page and copy init's instructions
  // and data into it.
  uvminit(p->pagetable, p->kpagetable, initcode, sizeof(initcode));
  p->sz = PGSIZE;

  // prepare for the very first "return" from kernel to user.
  p->trapframe->epc = 0x0;   // user program counter
  p->trapframe->sp = PGSIZE; // user stack pointer

  safestrcpy(p->name, "initcode", sizeof(p->name));

  p->state = RUNNABLE;

  p->tmask = 0;

  release(&p->lock);
#ifdef DEBUG
  printf("userinit\n");
#endif
}

// Grow or shrink user memory by n bytes.
// Return 0 on success, -1 on failure.
int growproc(int n)
{
  uint sz;
  struct proc *p = myproc();

  sz = p->sz;
  if (n > 0)
  {
    if ((sz = uvmalloc(p->pagetable, p->kpagetable, sz, sz + n)) == 0)
    {
      return -1;
    }
  }
  else if (n < 0)
  {
    sz = uvmdealloc(p->pagetable, p->kpagetable, sz, sz + n);
  }
  p->sz = sz;
  return 0;
}

// Create a new process, copying the parent.
// Sets up child kernel stack to return as if from fork() system call.
int fork(void)
{
  int i, pid;
  struct proc *np;
  struct proc *p = myproc();

  // Allocate process.
  if ((np = allocproc()) == NULL)
  {
    return -1;
  }

  // Copy user memory from parent to child.
  if (uvmcopy(p->pagetable, np->pagetable, np->kpagetable, p->sz) < 0)
  {
    freeproc(np);
    release(&np->lock);
    return -1;
  }
  np->sz = p->sz;

  np->parent = p;

  // copy tracing mask from parent.
  np->tmask = p->tmask;

  // copy saved user registers.
  *(np->trapframe) = *(p->trapframe);

  // Cause fork to return 0 in the child.
  np->trapframe->a0 = 0;

  // increment reference counts on open file descriptors.
  for (i = 0; i < NOFILE; i++)
    if (p->ofile[i])
      np->ofile[i] = filedup(p->ofile[i]);
  np->cwd = edup(p->cwd);

  // added by lmq for SYS_mmap
  for(int i=0;i<VMA_MAX;i++)
  {
    if(p->vma[i].valid)
    {
      memmove(np->vma+i,p->vma+i,sizeof(struct VMA));
      filedup(p->vma[i].f);
    }
  }
  np->maxaddr=p->maxaddr;

  safestrcpy(np->name, p->name, sizeof(p->name));

  pid = np->pid;

  np->state = RUNNABLE;

  release(&np->lock);

  return pid;
}

// Pass p's abandoned children to init.
// Caller must hold p->lock.
void reparent(struct proc *p)
{
  struct proc *pp;

  for (pp = proc; pp < &proc[NPROC]; pp++)
  {
    // this code uses pp->parent without holding pp->lock.
    // acquiring the lock first could cause a deadlock
    // if pp or a child of pp were also in exit()
    // and about to try to lock p.
    if (pp->parent == p)
    {
      // pp->parent can't change between the check and the acquire()
      // because only the parent changes it, and we're the parent.
      acquire(&pp->lock);
      pp->parent = initproc;
      // we should wake up init here, but that would require
      // initproc->lock, which would be a deadlock, since we hold
      // the lock on one of init's children (pp). this is why
      // exit() always wakes init (before acquiring any locks).
      release(&pp->lock);
    }
  }
}

// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait().
void exit(int status)
{
  struct proc *p = myproc();

 if (p == initproc)
   panic("init exiting");

  // Close all open files.
  for (int fd = 0; fd < NOFILE; fd++)
  {
    if (p->ofile[fd])
    {
      struct file *f = p->ofile[fd];
      fileclose(f);
      p->ofile[fd] = 0;
    }
  }


  // added for SYS_mmap
  for(int i=0;i<VMA_MAX;i++)
  {
    if(p->vma[i].valid)
    {
      for(uint64 addr=p->vma[i].addr;addr<p->vma[i].addr+p->vma[i].len;addr+=PGSIZE)
      {
        if(walkaddr(p->pagetable,addr)!=0)
        {
          vmunmap(p->pagetable,addr,1,1);
        }
      }
      filewrite(p->vma[i].f,p->vma[i].addr,p->vma[i].len);
      fileclose(p->vma[i].f);
      p->vma[i].valid=0;
    }
  }


  eput(p->cwd);
  p->cwd = 0;

  // we might re-parent a child to init. we can't be precise about
  // waking up init, since we can't acquire its lock once we've
  // acquired any other proc lock. so wake up init whether that's
  // necessary or not. init may miss this wakeup, but that seems
  // harmless.
  acquire(&initproc->lock);
  wakeup1(initproc);
  release(&initproc->lock);

  // grab a copy of p->parent, to ensure that we unlock the same
  // parent we locked. in case our parent gives us away to init while
  // we're waiting for the parent lock. we may then race with an
  // exiting parent, but the result will be a harmless spurious wakeup
  // to a dead or wrong process; proc structs are never re-allocated
  // as anything else.
  acquire(&p->lock);
  struct proc *original_parent = p->parent;
  release(&p->lock);

  // we need the parent's lock in order to wake it up from wait().
  // the parent-then-child rule says we have to lock it first.
  acquire(&original_parent->lock);

  acquire(&p->lock);

  // Give any children to init.
  reparent(p);

  // Parent might be sleeping in wait().
  wakeup1(original_parent);

  // p->xstate = status;
  p->xstate=status<<8;
  p->state = ZOMBIE;

  release(&original_parent->lock);

  // Jump into the scheduler, never to return.
  sched();
  panic("zombie exit");
}

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int wait(uint64 addr)
{
  struct proc *np;
  int havekids, pid;
  struct proc *p = myproc();

  // hold p->lock for the whole time to avoid lost
  // wakeups from a child's exit().
  acquire(&p->lock);

  for (;;)
  {
    // Scan through table looking for exited children.
    havekids = 0;
    for (np = proc; np < &proc[NPROC]; np++)
    {
      // this code uses np->parent without holding np->lock.
      // acquiring the lock first would cause a deadlock,
      // since np might be an ancestor, and we already hold p->lock.
      if (np->parent == p)
      {
        // np->parent can't change between the check and the acquire()
        // because only the parent changes it, and we're the parent.
        acquire(&np->lock);
        havekids = 1;
        if (np->state == ZOMBIE)
        {
          // Found one.
          pid = np->pid;
          if (addr != 0 && copyout2(addr, (char *)&np->xstate, sizeof(np->xstate)) < 0)
          {
            release(&np->lock);
            release(&p->lock);
            return -1;
          }
          freeproc(np);
          release(&np->lock);
          release(&p->lock);
          return pid;
        }
        release(&np->lock);
      }
    }

    // No point waiting if we don't have any children.
    if (!havekids || p->killed)
    {
      release(&p->lock);
      return -1;
    }

    // Wait for a child to exit.
    sleep(p, &p->lock); // DOC: wait-sleep
  }
}

// Per-CPU process scheduler.
// Each CPU calls scheduler() after setting itself up.
// Scheduler never returns.  It loops, doing:
//  - choose a process to run.
//  - swtch to start running that process.
//  - eventually that process transfers control
//    via swtch back to the scheduler.
void scheduler(void)
{
  struct proc *p;
  struct cpu *c = mycpu();
  extern pagetable_t kernel_pagetable;

  c->proc = 0;
  for (;;)
  {
    // Avoid deadlock by ensuring that devices can interrupt.
    intr_on();

    int found = 0;
    for (p = proc; p < &proc[NPROC]; p++)
    {
      acquire(&p->lock);
      if (p->state == RUNNABLE)
      {
        // Switch to chosen process.  It is the process's job
        // to release its lock and then reacquire it
        // before jumping back to us.
        // printf("[scheduler]found runnable proc with pid: %d\n", p->pid);
        p->state = RUNNING;
        c->proc = p;
        w_satp(MAKE_SATP(p->kpagetable));
        sfence_vma();
        swtch(&c->context, &p->context);
        w_satp(MAKE_SATP(kernel_pagetable));
        sfence_vma();
        // Process is done running for now.
        // It should have changed its p->state before coming back.
        c->proc = 0;

        found = 1;
      }
      release(&p->lock);
    }
    if (found == 0)
    {
      intr_on();
      asm volatile("wfi");
    }
  }
}

// Switch to scheduler.  Must hold only p->lock
// and have changed proc->state. Saves and restores
// intena because intena is a property of this
// kernel thread, not this CPU. It should
// be proc->intena and proc->noff, but that would
// break in the few places where a lock is held but
// there's no process.
void sched(void)
{
  int intena;
  struct proc *p = myproc();

  if (!holding(&p->lock))
    panic("sched p->lock");
  if (mycpu()->noff != 1)
    panic("sched locks");
  if (p->state == RUNNING)
    panic("sched running");
  if (intr_get())
    panic("sched interruptible");

  intena = mycpu()->intena;
  swtch(&p->context, &mycpu()->context);
  mycpu()->intena = intena;
}

// Give up the CPU for one scheduling round.
void yield(void)
{
  struct proc *p = myproc();
  acquire(&p->lock);
  p->state = RUNNABLE;
  sched();
  release(&p->lock);
}

// A fork child's very first scheduling by scheduler()
// will swtch to forkret.
void forkret(void)
{
  // printf("run in forkret\n");
  static int first = 1;

  // Still holding p->lock from scheduler.
  release(&myproc()->lock);

  if (first)
  {
    // File system initialization must be run in the context of a
    // regular process (e.g., because it calls sleep), and thus cannot
    // be run from main().
    // printf("[forkret]first scheduling\n");
    first = 0;
    fat32_init();
    myproc()->cwd = ename("/");
  }

  usertrapret();
}

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();

  // Must acquire p->lock in order to
  // change p->state and then call sched.
  // Once we hold p->lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup locks p->lock),
  // so it's okay to release lk.
  if (lk != &p->lock)
  {                    // DOC: sleeplock0
    acquire(&p->lock); // DOC: sleeplock1
    release(lk);
  }

  // Go to sleep.
  p->chan = chan;
  p->state = SLEEPING;

  sched();

  // Tidy up.
  p->chan = 0;

  // Reacquire original lock.
  if (lk != &p->lock)
  {
    release(&p->lock);
    acquire(lk);
  }
}

// Wake up all processes sleeping on chan.
// Must be called without any p->lock.
void wakeup(void *chan)
{
  struct proc *p;

  for (p = proc; p < &proc[NPROC]; p++)
  {
    acquire(&p->lock);
    if (p->state == SLEEPING && p->chan == chan)
    {
      p->state = RUNNABLE;
    }
    release(&p->lock);
  }
}

// Wake up p if it is sleeping in wait(); used by exit().
// Caller must hold p->lock.
static void
wakeup1(struct proc *p)
{
  if (!holding(&p->lock))
    panic("wakeup1");
  if (p->chan == p && p->state == SLEEPING)
  {
    p->state = RUNNABLE;
  }
}

// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int kill(int pid)
{
  struct proc *p;

  for (p = proc; p < &proc[NPROC]; p++)
  {
    acquire(&p->lock);
    if (p->pid == pid)
    {
      p->killed = 1;
      if (p->state == SLEEPING)
      {
        // Wake process from sleep().
        p->state = RUNNABLE;
      }
      release(&p->lock);
      return 0;
    }
    release(&p->lock);
  }
  return -1;
}

// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
  struct proc *p = myproc();
  if (user_dst)
  {
    return copyout(p->pagetable, dst, src, len);
    // return copyout2(dst, src, len);
  }
  else
  {
    memmove((char *)dst, src, len);
    return 0;
  }
}

// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
  struct proc *p = myproc();
  if (user_src)
  {
    return copyin(p->pagetable, dst, src, len);
    // return copyin2(dst, src, len);
  }
  else
  {
    memmove(dst, (char *)src, len);
    return 0;
  }
}

// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void procdump(void)
{
  static char *states[] = {
      [UNUSED] "unused",
      [SLEEPING] "sleep ",
      [RUNNABLE] "runble",
      [RUNNING] "run   ",
      [ZOMBIE] "zombie"};
  struct proc *p;
  char *state;

  printf("\nPID\tSTATE\tNAME\tMEM\n");
  for (p = proc; p < &proc[NPROC]; p++)
  {
    if (p->state == UNUSED)
      continue;
    if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
      state = states[p->state];
    else
      state = "???";
    printf("%d\t%s\t%s\t%d", p->pid, state, p->name, p->sz);
    printf("\n");
  }
}

uint64
procnum(void)
{
  int num = 0;
  struct proc *p;

  for (p = proc; p < &proc[NPROC]; p++)
  {
    if (p->state != UNUSED)
    {
      num++;
    }
  }

  return num;
}


// added by lmq for SYS_clone
int clone(int flags, uint64 stack, int ptid, int tls, int ctid)
{
  int i, pid;
  struct proc *np;
  struct proc *p = myproc();

  // Allocate process.
  if ((np = allocproc()) == NULL)
  {
    return -1;
  }

  // Copy user memory from parent to child.
  if (uvmcopy(p->pagetable, np->pagetable, np->kpagetable, p->sz) < 0)
  {
    freeproc(np);
    release(&np->lock);
    return -1;
  }
  np->sz = p->sz;

  np->parent = p;

  // copy tracing mask from parent.
  np->tmask = p->tmask;

  // copy saved user registers.
  *(np->trapframe) = *(p->trapframe);

  // Cause fork to return 0 in the child.
  np->trapframe->a0 = 0;
  // printf("child stack is %d\n", stack);
  np->trapframe->sp=stack;
  // increment reference counts on open file descriptors.
  for (i = 0; i < NOFILE; i++)
    if (p->ofile[i])
      np->ofile[i] = filedup(p->ofile[i]);
  np->cwd = edup(p->cwd);

  safestrcpy(np->name, p->name, sizeof(p->name));

  pid = np->pid;

  np->state = RUNNABLE;

  release(&np->lock);

  return pid;
}


// added by lmq for SYS_wait4
/**
 * @cpid:pid of child process,-1 stands for waiting for any child
 * @addr:address to store return status of child process
 * @options:default 0
 * @return:pid of child process;-1 means failure
 */
int waitpid(int cpid, uint64 addr, int options)
{
  if (cpid == -1) // wait for any child
  {
    return wait(addr);
  }
  struct proc *pp;
  int havekids, pid;
  struct proc *p = myproc();

  acquire(&p->lock);

  for (;;)
  {
    havekids = 0;
    for (pp = proc; pp < &proc[NPROC]; pp++)
    {
      if (pp->parent == p && pp->pid == cpid)
      {
        acquire(&pp->lock);

        havekids = 1;
        if (pp->state == ZOMBIE)
        {
          pid = pp->pid;
          if (addr != 0 && copyout(p->pagetable, addr, (char *)&pp->xstate,
                                   sizeof(pp->xstate)) < 0)
          {
            release(&pp->lock);
            release(&p->lock);
            return -1;
          }
          freeproc(pp);
          release(&pp->lock);
          release(&p->lock);
          return pid;
        }
        release(&pp->lock);
      }
    }

    if (!havekids || p->killed)
    {
      release(&p->lock);
      panic("current process do not have child process [cpid]");
    }

    // Wait for a child to exit.
    sleep(p, &p->lock); // DOC: wait-sleep

  }
}
