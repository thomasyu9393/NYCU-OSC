.section ".text.boot"
.global _start
_start:
    // TODO: Clear the .bss section
    la t0, __bss_start
    la t1, __bss_stop
clear_bss:
    bgeu t0, t1, clear_bss_done
    sd zero, 0(t0)  # Store doubleword
    addi t0, t0, 8
    j clear_bss
clear_bss_done:
    // TODO: Set up the stack pointer
    la sp, _end
    tail start_kernel
