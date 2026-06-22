<img width="1212" height="557" alt="image" src="https://github.com/user-attachments/assets/02af5453-8edd-4565-8a02-3456a63d8aa0" />

# Synchronous FIFO using SystemVerilog

## Overview

This project implements a **Synchronous First-In-First-Out (FIFO) Memory Buffer** using **SystemVerilog**. The FIFO is designed to store and retrieve data in the exact order it was received, following the **First-In-First-Out (FIFO)** principle.

The design is parameterized, allowing customization of data width and memory depth. SystemVerilog interfaces are used to simplify communication between the DUT and the testbench, improving code readability and maintainability.

The FIFO was developed and verified using **Xilinx Vivado Simulator**.

---

## Features

* Fully synchronous design with a single clock domain
* Parameterized data width and FIFO depth
* Automatic generation of:

  * Full flag
  * Empty flag
  * Read pointer
  * Write pointer
* Protection against:

  * Overflow (write when FIFO is full)
  * Underflow (read when FIFO is empty)
* Interface-based verification environment
* Compatible with FPGA implementation and simulation

---

## Project Structure

```text
├── fifo.sv        # FIFO RTL Design
├── tb_fifo.sv     # Testbench and Interface
└── README.md      # Project Documentation
```

### File Description

#### fifo.sv

Contains the RTL implementation of the synchronous FIFO.

Key functionalities:

* Memory array declaration
* Write logic
* Read logic
* Pointer management
* Full and empty flag generation

#### tb_fifo.sv

Contains:

* SystemVerilog interface
* Clock generation
* Reset generation
* Stimulus generation
* FIFO verification logic

---

## FIFO Architecture

### Block Diagram

```text
          +---------------------+
          |     Synchronous     |
          |        FIFO         |
          +---------------------+
                 |        |
         Write   |        | Read
         Logic   |        | Logic
                 |        |
        +----------------------+
        |      Memory Array    |
        +----------------------+
                 |        |
           wr_ptr        rd_ptr
                 |
            Counter Logic
                 |
         +---------------+
         | Full / Empty  |
         |    Flags      |
         +---------------+
```

---

## Design Parameters

| Parameter  | Description                | Default Value |
| ---------- | -------------------------- | ------------- |
| DATA_WIDTH | Width of FIFO data bus     | 8 bits        |
| DEPTH      | Number of memory locations | 16            |
| ADDR_WIDTH | Address width for pointers | 4 bits        |

---

## Working Principle

### Write Operation

Data is written into the FIFO when:

```systemverilog
wr_en = 1
full  = 0
```

The input data is stored at the location pointed to by `wr_ptr`.

After a successful write:

```text
wr_ptr = wr_ptr + 1
count  = count + 1
```

---

### Read Operation

Data is read from the FIFO when:

```systemverilog
rd_en = 1
empty = 0
```

The data at the location pointed to by `rd_ptr` is transferred to the output.

After a successful read:

```text
rd_ptr = rd_ptr + 1
count  = count - 1
```

---

### Full Condition

The FIFO is considered full when:

```text
count == DEPTH
```

When full:

* Additional writes are blocked.
* Data already stored remains intact.

---

### Empty Condition

The FIFO is considered empty when:

```text
count == 0
```

When empty:

* Read operations are blocked.
* No invalid data is produced.

---

## Verification Methodology

The FIFO functionality was verified through simulation using a directed testbench.

### Test Cases Executed

### 1. Reset Verification

Objective:

* Ensure all internal registers are initialized correctly.

Expected Results:

* `wr_ptr = 0`
* `rd_ptr = 0`
* `count = 0`
* `empty = 1`
* `full = 0`

---

### 2. Write Operation Verification

Stimulus:

```text
8'hA1
8'hB2
8'hC3
```

Operation:

* Three consecutive write transactions were applied.

Expected FIFO Contents:

```text
Address 0 -> A1
Address 1 -> B2
Address 2 -> C3
```

---

### 3. Read Operation Verification

Three consecutive read transactions were performed.

Expected Output Sequence:

```text
A1
B2
C3
```

Result:

* Data was retrieved in the exact order it was written, confirming FIFO behavior.

---

### 4. Status Flag Verification

Verified:

* Empty flag assertion after reset.
* Empty flag deassertion after first write.
* Full flag functionality during filling operations.
* Proper flag updates after reads.

---

## Simulation Results

Simulation confirmed successful FIFO operation.

Observed behavior:

✔ Reset initializes FIFO correctly

✔ Data written successfully into memory

✔ Data read successfully in FIFO order

✔ Empty flag operates correctly

✔ No overflow or underflow conditions observed

### Write Sequence

```text
Write A1
Write B2
Write C3
```

### Read Sequence

```text
Read A1
Read B2
Read C3
```

FIFO Order Verification:

```text
A1 → B2 → C3
```

Result: PASS

---

## Simulation Waveform

The waveform below shows:

* Reset operation
* Write transactions
* Read transactions
* FIFO status transitions

<p align="center">
  <img src="https://github.com/user-attachments/assets/02af5453-8edd-4565-8a02-3456a63d8aa0" alt="FIFO Simulation Waveform">
</p>

---

## Tools Used

* SystemVerilog
* Xilinx Vivado Simulator
* Vivado Design Suite

---

## Future Enhancements

* Asynchronous FIFO implementation
* Functional coverage collection
* SystemVerilog Assertions (SVA)
* UVM-based verification environment
* Randomized testbench generation
* Scoreboard and reference model integration

---

## Conclusion

The Synchronous FIFO design was successfully implemented and verified in SystemVerilog. The design correctly stores and retrieves data according to FIFO principles while preventing overflow and underflow conditions through full and empty flag logic. Simulation results confirm the correctness and reliability of the implementation.
