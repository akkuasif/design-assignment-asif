<img width="1577" height="655" alt="image" src="https://github.com/user-attachments/assets/4de926e1-add4-46af-b1b7-ee8e9c3a7a80" /><img width="1577" height="655" alt="image" src="https://github.com/user-attachments/assets/b3e2f1ed-5165-4d5b-8095-352e625f2a9f" />
# APB Protocol Design and Verification

## Overview

This project implements an Advanced Peripheral Bus (APB) Design using Verilog and verifies its functionality using a layered SystemVerilog testbench. The verification environment follows a modular architecture consisting of Generator, Driver, Monitor, Scoreboard, Agent, Environment, and Test components.

The project demonstrates APB read and write transactions, protocol timing verification, and data integrity checking through a scoreboard-based verification approach.

---

## Project Structure

### Design Files

#### apb_master.sv

Implements the APB Master Finite State Machine (FSM).

Features:

* IDLE State
* SETUP State
* ACCESS State
* APB Read Transfer
* APB Write Transfer
* Address and Data Generation

#### apb_slave.sv

Implements the APB Slave Peripheral.

Features:

* Internal Register Memory
* Read Operation
* Write Operation
* PREADY Generation
* PRDATA Generation

---

### Verification Files

#### apb_if.sv

SystemVerilog Interface used to connect the verification environment with the DUT.

#### transaction.sv

Defines APB transaction packets.

Fields:

* Address
* Data
* Read/Write Control

#### generator.sv

Generates randomized APB transactions and sends them to the driver through a mailbox.

#### driver.sv

Receives transactions from the generator and drives APB signals onto the DUT interface.

#### monitor.sv

Monitors APB bus activity and converts signal-level activity into transaction objects.

#### scoreboard.sv

Compares actual DUT outputs against expected values and reports PASS/FAIL results.

#### agent.sv

Container for:

* Generator
* Driver
* Monitor

#### env.sv

Verification environment containing:

* Agent
* Scoreboard

#### test.sv

Creates and runs the verification environment.

#### top.sv

Top-level simulation module.

Responsibilities:

* Instantiates DUT
* Instantiates Interface
* Creates Verification Components
* Generates Clock and Reset
* Starts Simulation

---

## APB Protocol Verification Flow

Generator
→ Driver
→ Interface
→ DUT

Monitor
→ Scoreboard

The verification environment checks:

* APB Read Transfers
* APB Write Transfers
* Address Stability
* Data Stability
* PSEL and PENABLE Timing
* Read Data Correctness
* Protocol Compliance

---

## Simulation Procedure

Compile Files:

```tcl
vlog apb_master.sv
vlog apb_slave.sv

vlog apb_if.sv
vlog transaction.sv
vlog generator.sv
vlog driver.sv
vlog monitor.sv
vlog scoreboard.sv
vlog agent.sv
vlog env.sv
vlog test.sv

vlog top.sv
```

Run Simulation:

```tcl
vsim top
add wave *
run -all
```

---

## Verification Results

The following checks were performed:

* Successful APB Write Transactions
* Successful APB Read Transactions
* Correct Read Data Matching Written Data
* Proper FSM State Transitions
* Correct APB SETUP and ACCESS Phases
* Scoreboard-Based Data Verification

All test cases passed successfully.

---

## Tools Used

* Verilog
* SystemVerilog
* ModelSim / QuestaSim
* EDA Playground

---

## Learning Outcomes

Through this project, the following concepts were explored:

* APB Protocol Architecture
* FSM-Based Design
* SystemVerilog Interfaces
* Mailboxes
* Generator-Driver Communication
* Monitor and Scoreboard Methodology
* Layered Verification Environment
* Functional Verification Flow

