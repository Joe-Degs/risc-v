## this code is copied from the riscv assembly manual to understand
## interrupt handling in assembly

.globl main

.equ RTC_BASE,      0x40000000
.equ TIMER_BASE,    0x40004000

main:
# setup machine trap vectord
1:      auipc   t0, %pcrel_hi(mtvec)        # load mtvec(hi)
        addi    t0, t0, %pcrel_lo(1b)       # load mtvec(lo)
        csrrw   zero, mtvec, t0
## the `mtvec` csr is the `pc` for where to jump to if interrupts
## happen in your software

# set mstatus.MIE=1 (enable M mode interrupt)
        li      t0, 8
        csrrs   zero, mstatus, t0

## when a trap happens, the `mstatus` register has trap related
## information as group of bits.
## `mepc` holds the address of last instruction before the trap
## occured
## `mtvec` has the base address of the trap handler. known as the
## entry point of the trap
## `mcause has the number representing the exception that has occured

# set mie.MTIE=1 (enable M mode timer interrupts)
        li      t0, 128
        csrrs   zero, mie, t0

# read from mtime
        li      a0, RTC_BASE
        ld      a1, 0(a0)

# write to mtimecmp
        li      a0, TIMER_BASE
        li      t0, 1000000000
        add     a1, a1, t0
        sd      a1, 0(a0)

# loop
loop:
        wfi
        j loop

# break on interrupt
mtvec:
        csrrc  t0, mcause, zero
        bgez t0, fail       # interrupt causes are less than zero
        slli t0, t0, 1      # shift off high bit
        srli t0, t0, 1
        li t1, 7            # check this is an m_timer interrupt
        bne t0, t1, fail
        j pass

pass:
        la a0, pass_msg
        jal puts
        j shutdown

fail:
        la a0, fail_msg
        jal puts
        j shutdown

.section .rodata

pass_msg:
        .string "PASS\n"

fail_msg:
        .string "FAIL\n"
