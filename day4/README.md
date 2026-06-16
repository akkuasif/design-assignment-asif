
<img width="1600" height="906" alt="image" src="https://github.com/user-attachments/assets/ae655b2c-77b0-416a-bc22-4e1ac6796292" />
Block Memory Generators (Instruction & Data BRAM)

Overview: A dual-memory architecture utilizing Xilinx Block Memory Generator (BMG) IP cores. This setup acts as the primary physical memory for the C-DAC soft-core processor.

Architecture Style: Harvard Architecture. The system uses two physically separated memory banks to allow simultaneous instruction fetching and data reading/writing without bottlenecking the AXI bus.

Component 1: Instruction Memory (blk_mem_gen_0)

Role: Read-Only Memory (from the processor's perspective during execution).

Description: Stores the compiled C code (executable instructions). The processor's dedicated instruction-fetch master port requests data from this BRAM on every clock cycle.

Component 2: Data Memory (blk_mem_gen_1)

Role: Read/Write Random Access Memory (RAM).

Description: Stores active variables, the call stack, and heap data. The processor's data master port interacts with this memory to perform load and store operations during program execution.

Associated Interface: AXI BRAM Controller

Role: The Protocol Translator.

Description: Sits immediately in front of the BRAMs. It automatically translates the 32-bit AXI memory-mapped byte-addressing requested by the processor into the specific word-addressing required by the physical Block RAM hardware.

System-on-Chip Integration: Both memory banks are accessible via the central AXI Crossbar, allowing the soft processor to boot dynamically and execute embedded software directly from the FPGA fabric.
