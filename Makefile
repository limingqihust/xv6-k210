# platform	:= k210
platform	:= qemu
# mode := debug
mode := release
K=kernel
U=xv6-user
T=target

# added by lmq
TEST=test/build/riscv64

OBJS =
ifeq ($(platform), k210)
OBJS += $K/entry_k210.o
else
OBJS += $K/entry_qemu.o
endif

OBJS += \
  $K/printf.o \
  $K/kalloc.o \
  $K/intr.o \
  $K/spinlock.o \
  $K/string.o \
  $K/main.o \
  $K/vm.o \
  $K/proc.o \
  $K/swtch.o \
  $K/trampoline.o \
  $K/trap.o \
  $K/syscall.o \
  $K/sysproc.o \
  $K/bio.o \
  $K/sleeplock.o \
  $K/file.o \
  $K/pipe.o \
  $K/exec.o \
  $K/sysfile.o \
  $K/kernelvec.o \
  $K/timer.o \
  $K/disk.o \
  $K/fat32.o \
  $K/plic.o \
  $K/console.o

ifeq ($(platform), k210)
OBJS += \
  $K/spi.o \
  $K/gpiohs.o \
  $K/fpioa.o \
  $K/utils.o \
  $K/sdcard.o \
  $K/dmac.o \
  $K/sysctl.o \

else
OBJS += \
  $K/virtio_disk.o \
  $K/uart.o \

endif

QEMU = qemu-system-riscv64          		# 7.0.0

ifeq ($(platform), k210)
RUSTSBI = ./bootloader/SBI/sbi-k210
else
RUSTSBI = ./bootloader/SBI/sbi-qemu
endif

# TOOLPREFIX	:= riscv64-unknown-elf-
TOOLPREFIX	:= riscv64-linux-gnu-
CC = $(TOOLPREFIX)gcc
AS = $(TOOLPREFIX)gas
LD = $(TOOLPREFIX)ld
OBJCOPY = $(TOOLPREFIX)objcopy
OBJDUMP = $(TOOLPREFIX)objdump

CFLAGS = -Wall -Werror -O -fno-omit-frame-pointer -ggdb -g
CFLAGS += -MD
CFLAGS += -mcmodel=medany
CFLAGS += -ffreestanding -fno-common -nostdlib -mno-relax
CFLAGS += -I.
CFLAGS += $(shell $(CC) -fno-stack-protector -E -x c /dev/null >/dev/null 2>&1 && echo -fno-stack-protector)

# added by lmq for debug using fs.img
# CFLAGS += -D TEST


ifeq ($(mode), debug) 
CFLAGS += -D DEBUG 
endif 

ifeq ($(platform), qemu)
CFLAGS += -D QEMU
endif

LDFLAGS = -z max-page-size=4096

ifeq ($(platform), k210)
linker = ./linker/k210.ld
endif

ifeq ($(platform), qemu)
linker = ./linker/qemu.ld
endif

## Compile Kernel
#$T/kernel: $(OBJS) $(linker) $U/initcode
#	@if [ ! -d "./target" ]; then mkdir target; fi
#	@$(LD) $(LDFLAGS) -T $(linker) -o $T/kernel $(OBJS)
#	@$(OBJDUMP) -S $T/kernel > $T/kernel.asm
#	@$(OBJDUMP) -t $T/kernel | sed '1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d' > $T/kernel.sym

# Compile Kernel
kernel-qemu: $(OBJS) $(linker) $U/initcode
	@if [ ! -d "./target" ]; then mkdir target; fi
	@$(LD) $(LDFLAGS) -T $(linker) -o kernel-qemu $(OBJS)
	@$(OBJDUMP) -S kernel-qemu > kernel-qemu.asm
	@$(OBJDUMP) -t kernel-qemu | sed '1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d' > kernel-qemu.sym


build: kernel-qemu userprogs

# Compile RustSBI
RUSTSBI:
ifeq ($(platform), k210)
	@cd ./bootloader/SBI/rustsbi-k210 && cargo build && cp ./target/riscv64gc-unknown-none-elf/debug/rustsbi-k210 ../sbi-k210
	@$(OBJDUMP) -S ./bootloader/SBI/sbi-k210 > $T/rustsbi-k210.asm
else
	@cd ./bootloader/SBI/rustsbi-qemu && cargo build && cp ./target/riscv64gc-unknown-none-elf/debug/rustsbi-qemu ../sbi-qemu
	@$(OBJDUMP) -S ./bootloader/SBI/sbi-qemu > $T/rustsbi-qemu.asm
endif

rustsbi-clean:
	@cd ./bootloader/SBI/rustsbi-k210 && cargo clean
	@cd ./bootloader/SBI/rustsbi-qemu && cargo clean

image = $T/kernel.bin
k210 = $T/k210.bin
k210-serialport := /dev/ttyUSB0

ifndef CPUS
CPUS := 2
endif

# modified by lmq
QEMUOPTS = -machine virt -kernel kernel-qemu -m 128M -nographic

# use multi-core 
QEMUOPTS += -smp $(CPUS)

# modified by lmq for test online
# QEMUOPTS += -bios $(RUSTSBI)
QEMUOPTS += -bios default

# import virtual disk image
QEMUOPTS += -drive file=fs.img,if=none,format=raw,id=x0
QEMUOPTS += -device virtio-blk-device,drive=x0,bus=virtio-mmio-bus.0

# run: build
# ifeq ($(platform), k210)
# 	@$(OBJCOPY) $T/kernel --strip-all -O binary $(image)
# 	@$(OBJCOPY) $(RUSTSBI) --strip-all -O binary $(k210)
# 	@dd if=$(image) of=$(k210) bs=128k seek=1
# 	@$(OBJDUMP) -D -b binary -m riscv $(k210) > $T/k210.asm
# 	@sudo chmod 777 $(k210-serialport)
# 	@python3 ./tools/kflash.py -p $(k210-serialport) -b 1500000 -t $(k210)
# else
# 	@$(QEMU) $(QEMUOPTS)
# endif

# 用于自己测试 make test
test: clean fs kernel-qemu
	@$(QEMU) $(QEMUOPTS)

# 供平台测试使用 make all;make run

all: clean kernel-qemu  

run:
	qemu-system-riscv64 -machine virt -kernel kernel-qemu -m 128M -nographic -smp 2 -bios default -drive file=sdcard.img,if=none,format=raw,id=x0  -device virtio-blk-device,drive=x0,bus=virtio-mmio-bus.0

# run:
# 	@$(QEMU) $(QEMUOPTS)

$U/initcode: $U/initcode.S
	$(CC) $(CFLAGS) -march=rv64g -nostdinc -I. -Ikernel -c $U/initcode.S -o $U/initcode.o
	$(LD) $(LDFLAGS) -N -e start -Ttext 0 -o $U/initcode.out $U/initcode.o
	$(OBJCOPY) -S -O binary $U/initcode.out $U/initcode
	$(OBJDUMP) -S $U/initcode.o > $U/initcode.asm

tags: $(OBJS) _init
	@etags *.S *.c

ULIB = $U/ulib.o $U/usys.o $U/printf.o $U/umalloc.o

_%: %.o $(ULIB)
	$(LD) $(LDFLAGS) -N -e main -Ttext 0 -o $@ $^
	$(OBJDUMP) -S $@ > $*.asm
	$(OBJDUMP) -t $@ | sed '1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d' > $*.sym

$U/usys.S : $U/usys.pl
	@perl $U/usys.pl > $U/usys.S

$U/usys.o : $U/usys.S
	$(CC) $(CFLAGS) -c -o $U/usys.o $U/usys.S

$U/_forktest: $U/forktest.o $(ULIB)
	# forktest has less library code linked in - needs to be small
	# in order to be able to max out the proc table.
	$(LD) $(LDFLAGS) -N -e main -Ttext 0 -o $U/_forktest $U/forktest.o $U/ulib.o $U/usys.o
	$(OBJDUMP) -S $U/_forktest > $U/forktest.asm

# Prevent deletion of intermediate files, e.g. cat.o, after first build, so
# that disk image changes after first build are persistent until clean.  More
# details:
# http://www.gnu.org/software/make/manual/html_node/Chained-Rules.html
.PRECIOUS: %.o

UPROGS=\
	$U/_init\
	$U/_sh\
	$U/_cat\
	$U/_echo\
	$U/_grep\
	$U/_ls\
	$U/_kill\
	$U/_mkdir\
	$U/_xargs\
	$U/_sleep\
	$U/_find\
	$U/_rm\
	$U/_wc\
	$U/_test\
	$U/_usertests\
	$U/_strace\
	$U/_mv\
	$U/_forktest\
	# $U/_wait\
	# $U/_fork\
	# $U/_ln\
	# $U/_stressfs\
	# $U/_grind\
	# $U/_zombie\

userprogs: $(UPROGS)

dst=/mnt

# @sudo cp $U/_init $(dst)/init
# @sudo cp $U/_sh $(dst)/sh
# Make fs image
fs: $(UPROGS)
	@if [ ! -f "fs.img" ]; then \
		echo "making fs image..."; \
		dd if=/dev/zero of=fs.img bs=512k count=512; \
		mkfs.vfat -F 32 fs.img; fi
	@sudo mount fs.img $(dst)
	@if [ ! -d "$(dst)/bin" ]; then sudo mkdir $(dst)/bin; fi
	@sudo cp README $(dst)/README
	@for file in $$( ls $U/_* ); do \
		sudo cp $$file $(dst)/$${file#$U/_};\
		sudo cp $$file $(dst)/bin/$${file#$U/_}; done

# added by lmq
	@for file in 'ls $(TEST)';do\
		sudo cp -r $(TEST)/$(file) $(dst)/$(file) ; done
	@sudo umount $(dst)


# Write mounted sdcard
sdcard: userprogs
	@if [ ! -d "$(dst)/bin" ]; then sudo mkdir $(dst)/bin; fi
	@for file in $$( ls $U/_* ); do \
		sudo cp $$file $(dst)/bin/$${file#$U/_}; done
	@sudo cp $U/_init $(dst)/init
	@sudo cp $U/_sh $(dst)/sh
	@sudo cp README $(dst)/README

clean: 
	rm -f *.tex *.dvi *.idx *.aux *.log *.ind *.ilg \
	rm -f ./fs.img \
	kernel-* \
	*/*.o */*.d */*.asm */*.sym \
	$T/* \
	$U/initcode $U/initcode.out \
	$K/kernel \
	$U/usys.S \
	$(UPROGS)


# added by lmq for debugging by gdb
GDBPORT = $(shell expr `id -u` % 5000 + 25000)

QEMUGDB = $(shell if $(QEMU) -help | grep -q '^-gdb'; \
	then echo "-gdb tcp::$(GDBPORT)"; \
	else echo "-s -p $(GDBPORT)"; fi)

.gdbinit: .gdbinit.tmpl-riscv
	sed "s/:1234/:$(GDBPORT)/" < $^ > $@

qemu-gdb: kernel-qemu .gdbinit fs
	@echo "*** Now run 'gdb' in another window." 1>&2
	$(QEMU) $(QEMUOPTS) -S $(QEMUGDB)
