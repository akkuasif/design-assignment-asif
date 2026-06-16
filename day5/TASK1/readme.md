<img width="1600" height="900" alt="image" src="https://github.com/user-attachments/assets/a97544c9-e60d-41a5-8ee1-84c88a5e1aca" />

The system is a SystemVerilog implementation of a 4-bit Binary Coded Decimal (BCD) adder. It adds two single-digit BCD numbers and a carry-in, producing a valid BCD sum and carry-out.

Core Design (bcd_adder) Mechanism: It first performs standard binary addition (temp = a + b + cin).
BCD Correction: It continually monitors the raw 5-bit sum (temp) for BCD overflows (values greater than 9).

If > 9: An overflow occurred. The logic corrects it by adding 6 to the raw sum, outputting the lower 4 bits as sum, and flagging cout as 1.

If <= 9: The result is valid. The logic outputs the raw sum directly and keeps cout at 0.

Interface (bcd_if) Purpose: A clean, modern way to bundle the physical connection signals (a, b, cin, sum, cout) into a single block.
Benefit: It eliminates redundant port wiring in the testbench and makes the verification environment scalable.

Testbench (tb_bcd_adder) Purpose: Verifies the hardware design by injecting test signals through the interface.
Test Cases: Evaluates two specific scenarios:

Standard Addition: Inputs 5 and 3. The sum is 8, verifying the logic works when no correction is needed.

Correction Addition: Inputs 9 and 8. The raw sum is 17, verifying the logic correctly catches the overflow, adds 6, and outputs a sum of 7 with a carry-out of 1.
