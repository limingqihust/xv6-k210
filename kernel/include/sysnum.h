#ifndef __SYSNUM_H
#define __SYSNUM_H

// System call numbers
#define SYS_fork         1
#define SYS_exit         93 //lzq
#define SYS_wait         3
#define SYS_pipe         4
#define SYS_read         5
#define SYS_kill         6
#define SYS_exec         7
#define SYS_fstat        8
#define SYS_chdir        9 
#define SYS_dup         10 
#define SYS_getpid      11 
#define SYS_sbrk        12
#define SYS_sleep       13
#define SYS_uptime      14
#define SYS_open        56
#define SYS_write       64 //lzq
#define SYS_remove      17
#define SYS_trace       18
#define SYS_sysinfo     19
#define SYS_mkdir       20
#define SYS_close       21 
#define SYS_test_proc   22
#define SYS_dev         23
#define SYS_readdir     24
#define SYS_getcwd      25 
#define SYS_rename      26
// lzq
#define SYS_brk         214
#define SYS_munmap      215
#define SYS_mmap        222
#define SYS_clone       220
/*
// added by lmq
// System call numbers
#define SYS_fork         1
// #define SYS_exit         2 // new
#define SYS_wait         3
#define SYS_pipe         4
// #define SYS_read         5 //  new
#define SYS_kill         6
#define SYS_exec         7
// #define SYS_fstat        8 // new
// #define SYS_chdir        9 // new
// #define SYS_dup         10 // new
// #define SYS_getpid      11 // new
#define SYS_sbrk        12
#define SYS_sleep       13
#define SYS_uptime      14
#define SYS_open        15
// #define SYS_write       16 // new
#define SYS_remove      511 // change syscall number
#define SYS_trace       18
#define SYS_sysinfo     19
#define SYS_mkdir       20
// #define SYS_close       21 // new
#define SYS_test_proc   22
#define SYS_dev         510 // change syscall number
#define SYS_readdir     24
// #define SYS_getcwd      25 // new
#define SYS_rename      26
// process management
#define SYS_clone       220
#define SYS_execve      221
#define SYS_wait4       260
#define SYS_exit        93
#define SYS_getppid     173
#define SYS_getpid      172
// memory management
#define SYS_brk         214
#define SYS_munmap      215
#define SYS_mmap        222
// other
#define SYS_times       153
#define SYS_uname       160
#define SYS_sched_yield 124
#define SYS_gettimeofday 169
#define SYS_nanosleep   101
// file 
#define SYS_getcwd      17
#define SYS_pipe2       59
#define SYS_dup         23
#define SYS_dup3        24
#define SYS_chdir       49
#define SYS_openat      56
#define SYS_close       57
#define SYS_getdents64  61
#define SYS_read        63
#define SYS_write       64
#define SYS_linkat      37
#define SYS_unlinkat    35
#define SYS_mkdirat     34
#define SYS_umount2     39
#define SYS_mount       40
#define SYS_fstat       80
*/
#endif