#ifndef __SYSNUM_H
#define __SYSNUM_H

// System call numbers
#define SYS_fork        1
#define SYS_wait        3
#define SYS_kill        6
#define SYS_exec        7
#define SYS_fstat       8
#define SYS_sbrk        12
#define SYS_sleep       13
#define SYS_uptime      14
#define SYS_open        15
#define SYS_remove      512
#define SYS_trace       18
#define SYS_sysinfo     19
#define SYS_mkdir       20
#define SYS_test_proc   22
#define SYS_dev         513
#define SYS_readdir     514
#define SYS_rename      26

// added by lmq
#define SYS_exit        93
#define SYS_getpid      172 
#define SYS_clone       220
#define SYS_wait4       260
#define SYS_sched_yield 124
#define SYS_getppid     173
#define SYS_execve      221
#define SYS_close       57
#define SYS_read        63
#define SYS_write       64 
#define SYS_openat      56
#define SYS_mkdirat     34
#define SYS_chdir       49
#define SYS_getcwd      17
#define SYS_pipe        59
#define SYS_dup         23
#define SYS_dup3        24

// lzq
#define SYS_brk         214
#define SYS_munmap      215
#define SYS_mmap        222
#endif