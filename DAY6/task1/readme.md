
<img width="1175" height="531" alt="image" src="https://github.com/user-attachments/assets/84112687-2217-41f5-8a1b-7a9541edeb05" />


# FIFO Design & Verification Documentation

## 1. FIFO Design (`fifo.sv`)

The design implements a parameterized **Synchronous First-In-First-Out (FIFO)** memory buffer.

### Parameters

* **DEPTH**: Number of storage locations in the FIFO (Default: 8)
* **DATA_WIDTH**: Width of each data word (Default: 8 bits)

### Ports

#### Inputs

* **clk** : System clock
* **rst_n** : Active-low reset
* **wr_en** : Write enable signal
* **rd_en** : Read enable signal
* **data_in[DATA_WIDTH-1:0]** : Input data bus

#### Outputs

* **data_out[DATA_WIDTH-1:0]** : Output data bus
* **full** : Indicates that the FIFO is full
* **empty** : Indicates that the FIFO is empty

### Design Logic

The FIFO uses separate **read** and **write pointers** to manage data movement within the memory array.

* A write operation occurs when `wr_en` is asserted and the FIFO is not full.
* A read operation occurs when `rd_en` is asserted and the FIFO is not empty.
* The read and write pointers are updated after successful transactions.
* The `full` and `empty` flags are generated based on the FIFO occupancy status, preventing overflow and underflow conditions.

---

## 2. Transaction Class (`fifo_transaction`)

A SystemVerilog transaction class was created to generate randomized stimulus and capture DUT responses during verification.

### Randomized Variables (Stimulus)

* **wr_en** (1-bit): Write enable signal
* **rd_en** (1-bit): Read enable signal
* **data_in** (8-bit): Data to be written into the FIFO

### Response Variables

* **data_out** (8-bit): Data read from the FIFO
* **full** (1-bit): Full status flag
* **empty** (1-bit): Empty status flag

### Constraints

The following constraint is applied during basic verification:

```systemverilog
constraint fifo_c {
    wr_en != rd_en;
}
```

This constraint prevents simultaneous read and write operations, allowing independent verification of write and read functionality.

### Methods

#### display()

A custom method used to print the randomized inputs and captured outputs in a formatted manner, simplifying simulation debugging and result analysis.

---

## 3. Simulation Results

The FIFO was simulated using Xilinx Vivado Simulator.

### Verification Performed

1. Reset functionality verification
2. Randomized write operations
3. Randomized read operations
4. FIFO ordering verification (FIFO property)
5. Full flag verification
6. Empty flag verification
7. Overflow protection verification
8. Underflow protection verification

### Result

The simulation confirmed correct FIFO operation:

* Data was written successfully into the FIFO.
* Data was read in the same order in which it was written.
* Full and Empty flags behaved correctly.
* No overflow or underflow conditions were observed.

### Simulation Waveform

The waveform demonstrates:

* Reset initialization
* Write transactions
* Read transactions
* FIFO status flag transitions
* Correct FIFO data ordering

**Status: PASS**
