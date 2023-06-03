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
#==========test for brk=========
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
    li      a7,SYS_shutdown
    ecall

test_brk:
    .string "/brk\0"


.p2align 2
argv_brk:
    .long test_brk
    .long 0
