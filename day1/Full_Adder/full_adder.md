**simulation of full_adder_tb:** 

<img width="1571" height="822" alt="image" src="https://github.com/user-attachments/assets/708a846c-fbde-4663-882b-84f89e97c95e" />
 # Full Adder Design and Verification

## Overview

A **Full Adder** is a fundamental combinational logic circuit used in digital systems to perform the addition of three single-bit binary inputs: two operand bits and a carry-in bit from a previous stage. It generates two outputs: a **Sum** bit and a **Carry-Out** bit.

Full Adders serve as the basic building blocks for larger arithmetic circuits such as:

* Ripple Carry Adders (RCA)
* Carry Lookahead Adders (CLA)
* Arithmetic Logic Units (ALU)
* Multipliers and Accumulators

---

## Functional Description

The Full Adder performs the following operation:

```text
Sum  = A ⊕ B ⊕ Cin
Cout = (A & B) | (B & Cin) | (A & Cin)
```

Where:

* **A** = First operand bit
* **B** = Second operand bit
* **Cin** = Carry input
* **Sum** = Sum output
* **Cout** = Carry output

---

## Block Diagram

```text
            A -------\
                      \
                       >---- Full Adder ----> Sum
                      /
            B -------/

            Cin --------------------------->

                               |
                               v
                             Cout
```

---

## Port Description

| Port Name | Direction | Width | Description                     |
| --------- | --------- | ----- | ------------------------------- |
| A         | Input     | 1-bit | First single-bit operand        |
| B         | Input     | 1-bit | Second single-bit operand       |
| Cin       | Input     | 1-bit | Carry input from previous stage |
| Sum       | Output    | 1-bit | Sum output                      |
| Cout      | Output    | 1-bit | Carry output to next stage      |

---

## Truth Table

| A | B | Cin | Sum | Cout |
| - | - | --- | --- | ---- |
| 0 | 0 | 0   | 0   | 0    |
| 0 | 0 | 1   | 1   | 0    |
| 0 | 1 | 0   | 1   | 0    |
| 0 | 1 | 1   | 0   | 1    |
| 1 | 0 | 0   | 1   | 0    |
| 1 | 0 | 1   | 0   | 1    |
| 1 | 1 | 0   | 0   | 1    |
| 1 | 1 | 1   | 1   | 1    |

---

## Project Structure

```text
project/
│
├── full_adder.v
├── tb_full_adder.v
└── README.md
```

### File Description

#### full_adder.v

Contains the RTL implementation of the Full Adder using combinational logic equations to generate the Sum and Carry outputs.

#### tb_full_adder.v

Contains the Verilog testbench used to verify the functionality of the Full Adder by applying all possible input combinations and observing the generated outputs.

---

## Verification Methodology

The Full Adder was verified using a directed testbench.

### Test Procedure

All possible combinations of the three input signals (`A`, `B`, and `Cin`) were applied.

Total test vectors:

```text
2³ = 8 combinations
```

For each input combination:

1. Inputs were applied to the DUT.
2. Sum and Carry outputs were observed.
3. Results were compared against the expected truth table values.

---

## Simulation Results

The simulation verified the correct operation of the Full Adder for all input combinations.

### Verification Checks

✔ Correct Sum generation

✔ Correct Carry-Out generation

✔ Truth table verification completed

✔ Functional simulation passed

---

## Simulation Waveform

The simulation waveform demonstrates:

* Sequential application of all input combinations
* Correct generation of Sum output
* Correct generation of Carry-Out output
* Matching behavior with the Full Adder truth table

### Expected Examples

| A | B | Cin | Sum | Cout |
| - | - | --- | --- | ---- |
| 0 | 1 | 0   | 1   | 0    |
| 1 | 1 | 0   | 0   | 1    |
| 1 | 1 | 1   | 1   | 1    |

**Simulation Status: PASS**

---

## Tools Used

* Verilog HDL
* Xilinx Vivado Simulator
* Vivado Design Suite

---

## Applications

* Arithmetic Logic Units (ALUs)
* Ripple Carry Adders
* Carry Lookahead Adders
* Digital Signal Processing (DSP)
* Microprocessors and Microcontrollers

---

## Conclusion

The Full Adder was successfully designed and verified using Verilog HDL. Simulation results confirmed correct implementation of the Sum and Carry logic for all possible input combinations. The design serves as a fundamental building block for larger arithmetic circuits used in digital systems.
