set confirm off
set architecture riscv:rv64
target remote 127.0.0.1:26000
symbol-file kernel-qemu
set disassemble-next-line auto
set riscv use-compressed-breakpoints yes
file kernel-qemu
