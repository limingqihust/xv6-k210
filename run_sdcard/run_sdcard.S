#include "../kernel/include/sysnum.h"
.global start
start:
    # dev(O_RDWR,CONSOLE,0)
    li      a0,0x2
    li      a1,0x1
    li      a3,0
    li      a7,SYS_dev
    ecall
    # dup(0)
    li      a0,0
    li      a7,SYS_dup
    ecall
    # dup(0)
    li      a0,0
    li      a7,SYS_dup
    ecall
#==========test for brk==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_brk
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_brk
run_brk:
    la      a0,test_brk
    la      a1,argv_brk
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_brk:
#==========test for chdir==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_chdir
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_chdir
run_chdir:
    la      a0,test_chdir
    la      a1,argv_chdir
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_chdir:
#==========test for clone==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_clone
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_clone
run_clone:
    la      a0,test_clone
    la      a1,argv_clone
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_clone:
#==========test for close==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_close
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_close
run_close:
    la      a0,test_close
    la      a1,argv_close
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_close:
#==========test for dup==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_dup
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_dup
run_dup:
    la      a0,test_dup
    la      a1,argv_dup
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_dup:
#==========test for dup2==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_dup2
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_dup2
run_dup2:
    la      a0,test_dup2
    la      a1,argv_dup2
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_dup2:
#==========test for execve==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_execve
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_execve
run_execve:
    la      a0,test_execve
    la      a1,argv_execve
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_execve:
#==========test for exit==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_exit
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_exit
run_exit:
    la      a0,test_exit
    la      a1,argv_exit
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_exit:
#==========test for fork==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_fork
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_fork
run_fork:
    la      a0,test_fork
    la      a1,argv_fork
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_fork:
#==========test for fstat==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_fstat
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_fstat
run_fstat:
    la      a0,test_fstat
    la      a1,argv_fstat
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_fstat:
#==========test for getcwd==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_getcwd
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_getcwd
run_getcwd:
    la      a0,test_getcwd
    la      a1,argv_getcwd
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_getcwd:
#==========test for getdents==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_getdents
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_getdents
run_getdents:
    la      a0,test_getdents
    la      a1,argv_getdents
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_getdents:
#==========test for getpid==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_getpid
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_getpid
run_getpid:
    la      a0,test_getpid
    la      a1,argv_getpid
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_getpid:
#==========test for getppid==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_getppid
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_getppid
run_getppid:
    la      a0,test_getppid
    la      a1,argv_getppid
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_getppid:
#==========test for gettimeofday==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_gettimeofday
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_gettimeofday
run_gettimeofday:
    la      a0,test_gettimeofday
    la      a1,argv_gettimeofday
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_gettimeofday:
#==========test for mkdir_==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_mkdir_
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_mkdir_
run_mkdir_:
    la      a0,test_mkdir_
    la      a1,argv_mkdir_
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_mkdir_:
#==========test for open==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_open
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_open
run_open:
    la      a0,test_open
    la      a1,argv_open
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_open:
#==========test for openat==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_openat
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_openat
run_openat:
    la      a0,test_openat
    la      a1,argv_openat
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_openat:
#==========test for pipe==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_pipe
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_pipe
run_pipe:
    la      a0,test_pipe
    la      a1,argv_pipe
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_pipe:
#==========test for read==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_read
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_read
run_read:
    la      a0,test_read
    la      a1,argv_read
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_read:
#==========test for sleep==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_sleep
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_sleep
run_sleep:
    la      a0,test_sleep
    la      a1,argv_sleep
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_sleep:
#==========test for times==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_times
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_times
run_times:
    la      a0,test_times
    la      a1,argv_times
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_times:
#==========test for uname==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_uname
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_uname
run_uname:
    la      a0,test_uname
    la      a1,argv_uname
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_uname:
#==========test for unlink==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_unlink
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_unlink
run_unlink:
    la      a0,test_unlink
    la      a1,argv_unlink
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_unlink:
#==========test for wait==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_wait
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_wait
run_wait:
    la      a0,test_wait
    la      a1,argv_wait
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_wait:
#==========test for waitpid==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_waitpid
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_waitpid
run_waitpid:
    la      a0,test_waitpid
    la      a1,argv_waitpid
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_waitpid:
#==========test for write==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_write
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_write
run_write:
    la      a0,test_write
    la      a1,argv_write
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_write:
#==========test for yield==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_yield
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_yield
run_yield:
    la      a0,test_yield
    la      a1,argv_yield
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_yield:
#==========test for mmap==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_mmap
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_mmap
run_mmap:
    la      a0,test_mmap
    la      a1,argv_mmap
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_mmap:
#==========test for munmap==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_munmap
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_munmap
run_munmap:
    la      a0,test_munmap
    la      a1,argv_munmap
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_munmap:
#==========test for mount==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_mount
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_mount
run_mount:
    la      a0,test_mount
    la      a1,argv_mount
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_mount:
#==========test for umount==========
    li      a7,SYS_fork
    ecall
    beq     a0,zero,run_umount
    li      a0,0
    li      a7,SYS_wait
    ecall
    jal     done_umount
run_umount:
    la      a0,test_umount
    la      a1,argv_umount
    li      a7,SYS_exec
    ecall
    li      a0,0
    li      a7,SYS_exit
    ecall
done_umount:

    li      a7,SYS_shutdown
    ecall

test_brk:
    .string "/brk\0"
test_chdir:
    .string "/chdir\0"
test_clone:
    .string "/clone\0"
test_close:
    .string "/close\0"
test_dup:
    .string "/dup\0"
test_dup2:
    .string "/dup2\0"
test_execve:
    .string "/execve\0"
test_exit:
    .string "/exit\0"
test_fork:
    .string "/fork\0"
test_fstat:
    .string "/fstat\0"
test_getcwd:
    .string "/getcwd\0"
test_getdents:
    .string "/getdents\0"
test_getpid:
    .string "/getpid\0"
test_getppid:
    .string "/getppid\0"
test_gettimeofday:
    .string "/gettimeofday\0"
test_mkdir_:
    .string "/mkdir_\0"
test_open:
    .string "/open\0"
test_openat:
    .string "/openat\0"
test_pipe:
    .string "/pipe\0"
test_read:
    .string "/read\0"
test_sleep:
    .string "/sleep\0"
test_times:
    .string "/times\0"
test_uname:
    .string "/uname\0"
test_unlink:
    .string "/unlink\0"
test_wait:
    .string "/wait\0"
test_waitpid:
    .string "/waitpid\0"
test_write:
    .string "/write\0"
test_yield:
    .string "/yield\0"
test_mount:
    .string "/mount\0"
test_umount:
    .string "/umount\0"
test_mmap:
    .string "/mmap\0"
test_munmap:
    .string "/munmap\0"


.p2align 2
argv_brk:
    .long test_brk
    .long 0
.p2align 2
argv_chdir:
    .long test_chdir
    .long 0
.p2align 2
argv_clone:
    .long test_clone
    .long 0
.p2align 2
argv_close:
    .long test_close
    .long 0
.p2align 2
argv_dup:
    .long test_dup
    .long 0
.p2align 2  
argv_dup2:
    .long test_dup2
    .long 0
.p2align 2
argv_execve:
    .long test_execve
    .long 0
.p2align 2
argv_exit:
    .long test_exit
    .long 0
.p2align 2
argv_fork:
    .long test_fork
    .long 0
.p2align 2
argv_fstat:
    .long test_fstat
    .long 0
.p2align 2
argv_getcwd:
    .long test_getcwd
    .long 0
.p2align 2
argv_getdents:
    .long test_getdents
    .long 0
.p2align 2
argv_getpid:
    .long test_getpid
    .long 0
.p2align 2
argv_getppid:
    .long test_getppid
    .long 0
.p2align 2
argv_gettimeofday:
    .long test_gettimeofday
    .long 0
.p2align 2
argv_mkdir_:
    .long test_mkdir_
    .long 0
.p2align 2
argv_mmap:
    .long test_mmap
    .long 0
.p2align 2
argv_mount:
    .long test_mount
    .long 0
.p2align 2
argv_munmap:
    .long test_munmap
    .long 0
.p2align 2
argv_open:
    .long test_open
    .long 0
.p2align 2
argv_openat:
    .long test_openat
    .long 0
.p2align 2
argv_pipe:
    .long test_pipe
    .long 0
.p2align 2
argv_read:
    .long test_read
    .long 0
.p2align 2
argv_sleep:
    .long test_sleep
    .long 0
.p2align 2
argv_times:
    .long test_times
    .long 0
.p2align 2
argv_umount:
    .long test_umount
    .long 0
.p2align 2
argv_uname:
    .long test_uname
    .long 0
.p2align 2
argv_unlink:
    .long test_unlink
    .long 0
.p2align 2
argv_wait:
    .long test_wait
    .long 0
.p2align 2
argv_waitpid:
    .long test_waitpid
    .long 0
.p2align 2
argv_write:
    .long test_write
    .long 0
.p2align 2
argv_yield:
    .long test_yield
    .long 0



    
