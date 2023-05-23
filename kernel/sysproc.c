
#include "include/types.h"
#include "include/riscv.h"
#include "include/param.h"
#include "include/memlayout.h"
#include "include/spinlock.h"
#include "include/proc.h"
#include "include/syscall.h"
#include "include/timer.h"
#include "include/kalloc.h"
#include "include/string.h"
#include "include/printf.h"
//lzq
#include "include/vm.h"
extern int exec(char *path, char **argv);

uint64
sys_exec(void)
{
  char path[FAT32_MAX_PATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
    if(i >= NELEM(argv)){
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
      goto bad;
    }
    if(uarg == 0){
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    if(argv[i] == 0)
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
      goto bad;
  }

  int ret = exec(path, argv);

  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    kfree(argv[i]);

  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    kfree(argv[i]);
  return -1;
}

uint64
sys_exit(void)
{
  int n;
  if(argint(0, &n) < 0)
    return -1;
  exit(n);
  return 0;  // not reached
}

uint64
sys_getpid(void)
{
  return myproc()->pid;
}

uint64
sys_fork(void)
{
  return fork();
}

uint64
sys_wait(void)
{
  uint64 p;
  if(argaddr(0, &p) < 0)
    return -1;
  return wait(p);
}

uint64
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

uint64
sys_sleep(void)
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

uint64
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
  uint xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}
    
uint64
sys_trace(void)
{
  int mask;
  if(argint(0, &mask) < 0) {
    return -1;
  }
  myproc()->tmask = mask;
  return 0;
}

// added by lmq
// create a child process
// input:
// flags:signal
// stack:stack of new process
// ptid:id of parent thread
// tls:TLS线程本地存储描述符
// ctid:id of child process
// ret:thread id of child process,-1 if fail

// added by lmq for SYS_clone
uint64
sys_clone(void)
{
  int flags,stack,ptid,tls,ctid;
  if(argint(0, &flags) < 0) {
    return -1;
  }
  if(argint(1, &stack) < 0) {
    return -1;
  }
  if(argint(2, &ptid) < 0) {
    return -1;
  }
  if(argint(3, &tls) < 0) {
    return -1;
  }
  if(argint(4, &ctid) < 0) {
    return -1;
  }

  // clone();
  return 0;
}

// (maybe)sysmem.c, below is all the Memory-related Code

// sys_brk lzq
// 将数据段addr 修改为 pos ， 成功则返回0
// Linux brk(0) return 0, but different in this work this will return the now addr
uint64
sys_brk(void){
    int addr, pos;
    if(argint(0, &pos) <0 )
        return -1;
    addr = myproc()->sz;
    if(pos == 0) return addr;//the diff with Linux brk(0)
    if(growproc(pos - addr) < 0)
        panic("growproc error");
    return 0;
}

uint64
sys_mmap(void){
    int addr;//映射起始位置，
    int len;
    int prot;// 映射的内存保护方式，可取：PROT_EXEC, PROT_READ, PROT_WRITE, PROT_NONE
    int flags;// 映射是否与其他进程共享的标志，
    int fd;// 文件句柄，
    int off;// 文件偏移量；

    if(argint(0, &addr) < 0 || argint(1, &len) < 0 || argint(2, &prot) < 0 ||
       argint(3, &flags) < 0 || argint(4, &fd) < 0 || argint(5, &off) < 0)
        return -1;

    char *mem = kalloc();
    memset(mem, 0, PGSIZE);
    if (mappages(myproc()->pagetable, len, PGSIZE, (uint64)mem, PTE_W|PTE_X|PTE_R|PTE_U) != 0) {
        kfree(mem);
        return 0;
    }
    return addr;
}

//uint64
//sys_munmap(void){
//    return  0;
//}
//  return clone(flags,stack,ptid,tls,ctid); ???
//}

// added by lmq for SYS_wait4
uint64
sys_wait4(void)
{
  int cpid;             // child pid which current pid is waiting for
  uint64 addr;          // addr of wstatus
  argint(0,&cpid);
  argaddr(1, &addr);
  return waitpid(cpid,addr,0);
}

// added by lmq for SYS_sched_yield
uint64
sys_sched_yield(void)
{
  yield();
  return 0;
}

// added by lmq for SYS_getppid
uint64 
sys_getppid(void)
{
  return myproc()->parent->pid;
}

// added by lmq for SYS_execve
uint64
sys_execve(void)
{
  char path[FAT32_MAX_PATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
    if(i >= NELEM(argv)){
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
      goto bad;
    }
    if(uarg == 0){
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    if(argv[i] == 0)
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
      goto bad;

  }
  int ret = exec(path, argv);
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    kfree(argv[i]);

  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    kfree(argv[i]);
  return -1;

}

