# RISC-V Assembly: GPIO LED Blinking Project

##  Project Overview

This project demonstrates how to blink an LED using RISC-V assembly language by directly accessing memory-mapped I/O registers for GPIO control.
The code configures GPIO pin 5 as an output and toggles its state between HIGH (ON) and LOW (OFF) with software delay loops to produce visible blinking.


##  Tools & Environment

- **Instruction Set:** RISC-V (RV32I)
- **Simulation Tool:** [Ripes](https://github.com/mortbopet/Ripes) or any RISC-V simulator that supports memory-mapped I/O.
- **Hardware Interface (Simulated):** GPIO register base address assumed at `0x10012000`.



##  How It Works

1. **GPIO Initialization:**
   - Clears the GPIO Function Select Register.
   - Sets GPIO pin 5 as an output.

2. **LED ON:**
   - Writes `0x20` (bit 5 high) to the GPIO Pin Control Register to turn ON the LED.

3. **Delay Loop:**
   - Waits using a busy loop to make LED ON duration visible.

4. **LED OFF:**
   - Writes `0x00` to clear pin 5 and turn OFF the LED.

5. **Another Delay Loop:**
   - Waits again before next cycle.

6. **Repeats indefinitely:**
   - Forms an infinite loop to continuously blink the LED.



##  Memory Map (Used)

| Register                      | Address     | Purpose                     |
|------------------------------|-------------|-----------------------------|
| GPIO Function Select Register| `0x10012004`| Select GPIO functions       |
| GPIO Output Control Register | `0x10012008`| Not directly used here      |
| GPIO Pin Control Register    | `0x1001200C`| Controls pin output state   |

---

##  Code Explanation Snippet

```assembly
li x4, 0x10012004     # GPIO function select register
sw x0, 0(x4)          # Clear register
li x5, 0x00000020     # Set GPIO5 (bit 5) as output
sw x5, 4(x4)          # Write to output-enable
