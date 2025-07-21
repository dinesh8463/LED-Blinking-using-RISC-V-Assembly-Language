.data
L1: .word 1000000

.text
.global main
main:
    # Initialize GPIO registers
    la x3, L1
    li x4, 0x10012004  # GPIO Function Select Register
    sw x0, 0(x4)       # Clear GPIO Function Select Register
    li x5, 0x00000020  # GPIO Function Select GPIO5 as output
    sw x5, 4(x4)       # Set GPIO5 as output
loop:
    # Set LED to ON
    li x6, 0x1001200C  # GPIO Pin Control Register 5
    li x5, 0x00000020  # Set GPIO5 to 1
    sw x5, 0(x6)

    # Wait for time
    la x3, L1
    lw x10, 0(x3)
L2:
    addi x7, x10, 0
L3:
    addi x7, x7, -1
    bne x7, x0, L3

    # Set LED to OFF
    li x6, 0x1001200C  # GPIO Pin Control Register 5
    li x5, 0x00000000  # Set GPIO5 to 0
    sw x5, 0(x6)

    # Wait for time
    la x3, L1
    lw x10, 0(x3)
L4:
    addi x7, x10, 0
L5:
    addi x7, x7, -1
    bne x7, x0, L5

    # Jump back to the beginning
    j loop

