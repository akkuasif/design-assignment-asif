**simulation of tb_bcd_adder.v:**
 
 
<img width="1316" height="646" alt="image" src="https://github.com/user-attachments/assets/0a6026d9-6781-4f5a-bba5-281358fd9be9" />

# Binary Coded Decimal (BCD) Adder Design and Verification

## Overview

A **Binary Coded Decimal (BCD) Adder** is a combinational logic circuit used to add two decimal digits represented in BCD format. In BCD representation, each decimal digit from 0 to 9 is encoded using a 4-bit binary number.

Since a valid BCD digit can only represent values from **0000 (0)** to **1001 (9)**, a simple binary addition may produce an invalid BCD result. Therefore, whenever the binary sum exceeds decimal 9 or generates a carry-out, a correction must be applied.

The correction is performed by adding **6 (0110₂)** to the intermediate binary sum, producing a valid BCD result and an appropriate carry output.

---

## Design Architecture

The BCD Adder consists of two major functional blocks:

### 1. Initial Binary Adder

A 4-bit binary adder performs the addition of:

```text id="b1"
A + B + Cin
```

where:

* **A** = First BCD digit
* **B** = Second BCD digit
* **Cin** = Input carry

This stage generates:

* Intermediate Sum
* Intermediate Carry

---

### 2. Detection and Correction Logic

The correction logic determines whether the intermediate result is a valid BCD digit.

Correction is required when:

```text id="b2"
Intermediate Sum > 1001 (Decimal 9)
```

or

```text id="b3"
Intermediate Carry = 1
```

When either condition is true, the circuit adds:

```text id="b4"
0110 (Decimal 6)
```

to the intermediate result.

This produces:

* Corrected BCD Sum
* Final BCD Carry Output

---

## Block Diagram

```text id="b5"
         A[3:0]
            \
             \
              +------------------+
         B[3:0] ---> Binary Adder|----+
              +------------------+    |
                                       |
                                       v
                          +-----------------------+
                          | Detection &           |
                          | Correction Logic      |
                          +-----------------------+
                                       |
                                       v
                               +--------------+
                               | Add 0110     |
                               +--------------+
                                       |
                                       v
                             Sum[3:0], Cout
```

---

## Working Example

### Example 1: No Correction Required

```text id="b6"
A = 0101 (5)
B = 0011 (3)

Binary Sum = 1000 (8)
```

Since the result is less than or equal to 9:

```text id="b7"
Sum = 1000
Cout = 0
```

---

### Example 2: Correction Required

```text id="b8"
A = 1001 (9)
B = 0101 (5)

Binary Sum = 1110 (14)
```

Since the result exceeds 9:

```text id="b9"
1110
+0110
-----
1 0100
```

Final Output:

```text id="b10"
Sum  = 0100
Cout = 1
```

Equivalent Decimal Result:

```text id="b11"
9 + 5 = 14
```

---

## Port Description

| Port Name | Direction | Width | Description                  |
| --------- | --------- | ----- | ---------------------------- |
| A         | Input     | 4-bit | First BCD digit input (0–9)  |
| B         | Input     | 4-bit | Second BCD digit input (0–9) |
| Cin       | Input     | 1-bit | Initial carry input          |
| Sum       | Output    | 4-bit | Corrected BCD sum output     |
| Cout      | Output    | 1-bit | Final BCD carry output       |

---

## Project Structure

```text id="b12"
project/
│
├── bcd_adder.v
├── tb_bcd_adder.v
├── bcd.md
└── README.md
```

### File Description

#### bcd_adder.v

Contains the RTL implementation of the BCD Adder, including:

* Binary addition logic
* BCD correction logic
* Carry generation logic

#### tb_bcd_adder.v

Contains the Verilog testbench used to verify the functionality of the BCD Adder under various input conditions.

#### bcd.md

Project documentation describing the architecture, operation, and verification methodology.

---

## Verification Methodology

The BCD Adder was verified using a directed testbench.

### Test Cases Performed

#### Test 1: Addition Without Correction

```text id="b13"
5 + 3 = 8
```

Expected:

```text id="b14"
Sum  = 1000
Cout = 0
```

Result: PASS

---

#### Test 2: Addition Requiring Correction

```text id="b15"
9 + 5 = 14
```

Expected:

```text id="b16"
Sum  = 0100
Cout = 1
```

Result: PASS

---

#### Test 3: Addition With Input Carry

```text id="b17"
8 + 7 + 1 = 16
```

Expected:

```text id="b18"
Sum  = 0110
Cout = 1
```

Result: PASS

---

## Simulation Results

The simulation waveform confirms:

* Correct binary addition
* Proper detection of invalid BCD sums
* Successful addition of correction value (0110)
* Accurate generation of BCD sum output
* Correct carry propagation

### Verification Status

✔ Binary Addition Verified

✔ BCD Correction Logic Verified

✔ Carry Generation Verified

✔ Functional Simulation Passed

---

## Simulation of `tb_bcd_adder.v`

The waveform demonstrates:

* Application of multiple BCD input combinations
* Detection of sums greater than decimal 9
* Automatic correction through addition of 6
* Correct generation of BCD-compliant outputs

**Simulation Status: PASS**

---

## Tools Used

* Verilog HDL
* Xilinx Vivado Simulator
* Vivado Design Suite

---

## Applications

* Decimal Arithmetic Units
* Financial Calculation Systems
* Digital Counters
* Calculator Circuits
* Embedded Systems Using Decimal Data

---

## Conclusion

The BCD Adder was successfully designed and verified using Verilog HDL. The circuit correctly performs decimal addition by detecting invalid BCD sums and applying the required correction factor of 6. Simulation results confirmed accurate operation for all tested input combinations, demonstrating reliable BCD arithmetic functionality.
