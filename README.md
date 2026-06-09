## Project Structure
The design is broken down into the following Verilog modules:

* **`full_adder.v`**: The foundational block. Performs 1-bit addition with a carry-in and carry-out.
* **`rca_4bit.v`**: A 4-bit Ripple Carry Adder. Adds two 4-bit binary numbers.
* **`bcd_adder.v`**: The top-level module. Uses the 4-bit RCA for initial binary addition and applies correction logic to ensure the output remains a valid BCD digit (0-9).
* **`tb_bcd_adder.v`**: The testbench used to verify the BCD adder logic against various edge cases.

## Theory of Operation
A standard 4-bit binary adder can represent numbers up to 15 (1111 in binary). However, BCD formatting only recognizes decimal digits from 0 to 9. 

When adding two BCD numbers, if the resulting binary sum is strictly greater than 9 (or generates a carry-out), it falls into an "invalid" BCD state. To correct this and properly carry over to the next decimal digit, the algorithm adds a correction factor of `6` (`0110` in binary) to the intermediate sum.

**Correction Logic Rules:**
1. Let $Z$ be the intermediate sum of inputs $A$ and $B$.
2. Let $K$ be the initial carry-out.
3. A BCD correction is triggered if: $K = 1$ **OR** $Z > 9$.
4. If triggered, Final Sum = $Z + 6$, and BCD Carry-Out = `1`.
5. Otherwise, Final Sum = $Z$, and BCD Carry-Out = `0`.

## Simulation Instructions (Xilinx Vivado)
This project includes a behavioral testbench designed to be run in Xilinx Vivado.

1. Create a new Vivado RTL project and add all `.v` design files.
2. Add `tb_bcd_adder.v` as a simulation source.
3. In the "Sources" pane under the "Simulation Sources" folder, right-click `tb_bcd_adder` and select **Set as Top**.
4. Click **Run Simulation -> Run Behavioral Simulation**.
5. The testbench automatically forces the following test vectors and prints the results to the waveform viewer:
    * **Normal addition:** 3 + 4 = 7
    * **Borderline case:** 5 + 4 = 9
    * **Correction threshold:** 8 + 5 = 13 (Outputs Sum: 3, Cout: 1)
    * **Max BCD input:** 9 + 9 = 18 (Outputs Sum: 8, Cout: 1)
