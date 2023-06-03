
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
#include "include/sbi.h"
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



// added by lmq for SYS_clone
uint64
sys_clone(void)
{
  int flags,ptid,tls,ctid;
  uint64 stack;
  if(argint(0, &flags) < 0) {
    return -1;
  }
  if(argaddr(1, &stack) < 0) {    // 子进程的栈地址
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
  if(stack==0)
  {
    return fork();
  }
  else
    return clone(flags,stack,ptid,tls,ctid);
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

uint64 
sys_shutdown(){
    sbi_shutdown();
    return 0;
}

// added by wyx for SYS_times

struct tms              
{                     
	long tms_utime;  
	long tms_stime;  
	long tms_cutime; 
	long tms_cstime; 
};


uint64 
sys_times(void) {
  struct tms *tmsbuf; // 用于存储时间数据的结构体指针

  if (argaddr(0, (void*)&tmsbuf) < 0)
      return -1; // 验证用户传递的结构体指针是否有效

  // 获取当前进程的运行时间数据，并填充到tmsbuf指向的结构体中
  tmsbuf->tms_utime = ticks; // 用户态CPU时间
  tmsbuf->tms_stime = 0; // 在xv6中无法直接获取系统态CPU时间
  tmsbuf->tms_cutime = 0; // 在xv6中无法直接获取子进程的用户态CPU时间
  tmsbuf->tms_cstime = 0; // 在xv6中无法直接获取子进程的系统态CPU时间

  return ticks; // 成功返回已经过去的滴答数
}


// added by wyx for SYS_uname
struct utsname {
	char sysname[65];
	char nodename[65];
	char release[65];
	char version[65];
	char machine[65];
	char domainname[65];
};

uint64
sys_uname(void)
{
    struct utsname *buf; // 用于存储系统信息的结构体指针

    if (argaddr(0, (void*)&buf) < 0)
        return -1; // 验证用户传递的结构体指针是否有效

    // 填充系统信息到buf指向的结构体中
    strncpy(buf->sysname, "HUSTLWL", sizeof(buf->sysname)); // 操作系统名称
    strncpy(buf->nodename, "LWL-host", sizeof(buf->nodename));  // 主机名
    strncpy(buf->release, "LWL--FirstVersion", sizeof(buf->release)); // 操作系统版本
    strncpy(buf->version, "0.1", sizeof(buf->version)); // 操作系统版本号
    strncpy(buf->machine, "x86-64", sizeof(buf->machine)); // 硬件架构

    return 0; // 返回成功
}


// added by wyx for SYS_gettimeofday
struct timespec {
    long tv_sec;   // 秒部分
    long tv_nsec;  // 纳秒部分
};

uint64
sys_gettimeofday(void)
{
    struct timespec now_ts; // 用于存储时间值的结构体指针
    uint64 ts_addr;
    if (argaddr(0, (void*)&ts_addr) < 0)
        return -1; // 验证用户传递的结构体指针是否有效

    // 获取当前时间，使用ticks转换为秒和纳秒部分
    uint tick = ticks;
    now_ts.tv_sec = tick / 100; // 每个滴答100个时钟周期，换算为秒
    now_ts.tv_nsec = (tick % 100) * (1000000000 / 100); // 换算为纳秒
    if(copyout2(ts_addr,(char*)&now_ts,sizeof(struct timespec)) < 0)
        return -1; // 将时间值拷贝到用户空间
    return 0; // 返回成功
}

// added by wyx for SYS_nanosleep
uint64
sys_nanosleep(void)
{
    struct timespec *req; // 用于指定休眠时间的结构体指针
    struct timespec *rem; // 用于返回剩余休眠时间的结构体指针

    if (argaddr(0, (void*)&req) < 0 ||
        argaddr(1, (void*)&rem) < 0)
        return -1; // 验证用户传递的结构体指针是否有效

    // 获取休眠时间
    uint sleep_sec = req->tv_sec;
    uint sleep_nsec = req->tv_nsec;

    // 计算总的休眠时间（以ticks为单位）
    uint sleep_ticks = sleep_sec * 100 + sleep_nsec / (1000000000 / 100);

    // 获取当前ticks
    uint start_ticks = ticks;
    uint end_ticks = start_ticks + sleep_ticks;

    // 执行休眠
    while (ticks < end_ticks)
        yield();

    // 返回剩余休眠时间（置为0，因为xv6没有提供返回剩余时间的功能）
    rem->tv_sec = 0;
    rem->tv_nsec = 0;

    return 0; // 返回成功
}
