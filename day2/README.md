## Overview
This repository contains a collection of fundamental combinational and sequential digital logic modules written in Verilog. Each module features a behavioral implementation designed for synthesis and simulation. 

---

## 1. 2-to-4 Decoder (`decoder_2to4.v`)
*(Note: Often colloquially referred to as a 4x2 decoder, though technically a 2-to-4 expanding decoder).*

A combinational logic circuit that takes a 2-bit binary input and activates exactly one of the 4 output lines based on the decimal equivalent of the input.

**Ports:**
* `input [1:0] a`: 2-bit selector input.
* `output [3:0] y`: 4-bit One-Hot output.

**Truth Table:**
| Input `a` | Output `y` | Active Line |
| :---: | :---: | :--- |
| 00 | 0001 | y[0] |
| 01 | 0010 | y[1] |
| 10 | 0100 | y[2] |
| 11 | 1000 | y[3] |

---

## 2. SR Flip-Flop (`sr_flipflop.v`)
A fundamental sequential logic memory element. This is a positive-edge triggered Set-Reset flip-flop. It holds its state until a clock edge occurs, at which point it reads the `s` and `r` inputs to determine the next state.

**Ports:**
* `input clk`: Clock signal (triggers on positive edge).
* `input s, r`: Set and Reset control inputs.
* `output reg q`: Main stored memory bit.
* `output q_bar`: Inverted output (`~q`).

**Operation Table (at positive clock edge):**
| `s` (Set) | `r` (Reset) | `q` (Output) | State |
| :---: | :---: | :---: | :--- |
| 0 | 0 | `q` | No Change (Hold) |
| 1 | 0 | 1 | Set |
| 0 | 1 | 0 | Reset |
| 1 | 1 | `x` | Invalid / Restricted |

---

## 3. D Flip-Flop (`d_flipflop.v`)
A streamlined memory element that eliminates the invalid state of the SR flip-flop. At every positive clock edge, the output `q` simply takes on whatever value is currently present at the data input `d`.

**Ports:**
* `input clk`: Clock signal.
* `input d`: Data input.
* `output reg q`: Stored output.
* `output q_bar`: Inverted output.

**Operation Table (at positive clock edge):**
| `d` (Data) | `q` (Output) | State |
| :---: | :---: | :--- |
| 0 | 0 | Store 0 |
| 1 | 1 | Store 1 |

---

## 4. Universal Shift Register (`usr.v`)
A highly versatile 4-bit sequential memory block capable of shifting data and operating in multiple input/output configurations. A 2-bit multiplexer (`mod`) controls the operational mode.

**Ports:**
* `input Clk, rst`: Clock and asynchronous reset signals.
* `input Sin`: 1-bit Serial Input.
* `input [3:0] Pin`: 4-bit Parallel Input.
* `input shift, load`: Enable signals for shifting data or loading parallel data.
* `input [1:0] mod`: 2-bit operation mode selector.
* `output Sout`: 1-bit Serial Output.
* `output [3:0] Pout`: 4-bit Parallel Output.

**Operational Modes (`mod`):**
| `mod` | Mode | Description | Required Enables |
| :---: | :---: | :--- | :--- |
| **00** | SISO | Serial In, Serial Out. Data is shifted in one bit at a time, and read out one bit at a time. | `shift` |
| **01** | SIPO | Serial In, Parallel Out. Data is shifted in serially, but all 4 bits are read simultaneously. | `shift` |
| **10** | PISO | Parallel In, Serial Out. 4 bits are loaded instantly, then shifted out single-file. | `load`, then `shift` |
| **11** | PIPO | Parallel In, Parallel Out. 4 bits are loaded instantly and read instantly. | `load` |
