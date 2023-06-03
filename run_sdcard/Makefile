main:
	riscv64-unknown-elf-gcc -march=rv64g -nostdinc -I. -Ikernel -c run_sdcard.S -o run_sdcard.o
	riscv64-unknown-elf-ld -z max-page-size=4096 -N -e start -Ttext 0 -o run_sdcard.out run_sdcard.o
	riscv64-unknown-elf-objcopy -S -O binary run_sdcard.out run_sdcard
#	riscv64-unknown-elf-objdump -S initcode.o > initcode.asm
	riscv64-unknown-elf-objdump -D -b binary -m riscv run_sdcard > run_sdcard.asm
	hexdump -C run_sdcard > run_sdcard.hex
	python3 run_sdcard.py
clean:
	rm -rf initcode.asm run_sdcard.o run_sdcard.out run_sdcard run_sdcard.hex run_sdcard.bin run_sdcard.asm

# main:
# 	riscv64-unknown-elf-gcc -march=rv64g -nostdinc -I. -Ikernel -c initcode.S -o initcode.o
# 	riscv64-unknown-elf-ld -z max-page-size=4096 -N -e start -Ttext 0 -o initcode.out initcode.o
# 	riscv64-unknown-elf-objcopy -S -O binary initcode.out initcode
# #	riscv64-unknown-elf-objdump -S initcode.o > initcode.asm
# 	riscv64-unknown-elf-objdump -D -b binary -m riscv initcode > initcode.asm
# clean:
# 	rm -rf initcode.asm initcode.o initcode.out initcode initcode.hex initcode.bin initcode.asm