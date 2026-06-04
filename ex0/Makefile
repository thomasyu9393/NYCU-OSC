RISCV_GNU ?= riscv64-elf
CC = $(RISCV_GNU)-gcc
LD = $(RISCV_GNU)-ld
OBJCOPY = $(RISCV_GNU)-objcopy
CFLAGS = -mcmodel=medany -ffreestanding -nostdlib -g -Wall
QEMU ?= qemu-system-riscv64
TARGET = kernel

build: clean
	$(CC) -c *.S
	$(LD) -T linker.ld -o $(TARGET).elf *.o
	$(OBJCOPY) -O binary $(TARGET).elf $(TARGET).bin

run: build $(TARGET).bin
	$(QEMU) -M virt -m 256M -kernel $(TARGET).bin -display none -d in_asm

clean:
	rm -f $(TARGET).bin $(TARGET).elf *.o
