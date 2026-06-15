
Overview This repository contains the Verilog RTL implementation and testbench for a synchronous 1110 Sequence Detector. The module is designed using a Mealy Machine Finite State Machine (FSM) architecture. It continuously monitors a 1-bit serial data stream and asserts an output flag high immediately upon detecting the specific binary pattern 1110.
Key Features Mealy Architecture: The output is determined by both the current state and the current input, allowing for instant, zero-latency detection.

Synchronous Reset: Includes an active-high synchronous reset to safely initialize the FSM to its default state.

Robust Pattern Handling: Smart state logic that resets on broken patterns but safely holds its state if consecutive 1s exceed the pattern requirements.

Zero-Latency Pulse: Generates a precise half-cycle pulse upon successful detection before returning to the idle state.

Port Interface clk (Input): System clock. All state transitions occur on the positive edge.

rst (Input): Synchronous active-high reset. Forces the FSM to the initial state when high.

din (Input): 1-bit serial data input stream.

detected (Output): 1-bit output flag. Asserts to 1 the moment 1110 is detected.

State Machine Encoding The design utilizes a 4-state architecture to track the progress of the incoming sequence:

idle (2'b00): Initial state. No relevant prefix detected.

s1 (2'b01): Valid prefix 1 detected.

s2 (2'b10): Valid prefix 11 detected.

s3 (2'b11): Valid prefix 111 detected.

State Transition Logic Because the target sequence (1110) relies on a continuous string of 1s, the state machine handles unexpected bits as follows:

Breaking the Pattern: If a 0 is received while the machine is building its prefix in states s1 or s2, the pattern is broken, and the FSM drops immediately back to the idle state.

Holding on Extra Ones: If the machine is holding three ones in state s3 and receives an additional 1 (forming 1111), it safely holds its position in s3. The last three bits still form a valid 111 prefix, allowing it to wait indefinitely for the final 0.

Successful Detection: When a 0 is received while the FSM is in state s3, the detected output is instantly driven high via combinational logic. On the next positive clock edge, the FSM transitions back to idle, returning the output to 0.

Example Timing Flow If the input stream receives 0 -> 1 -> 1 -> 1 -> 0:

din = 1 → State shifts idle to s1

din = 1 → State shifts s1 to s2

din = 1 → State shifts s2 to s3

din = 0 → detected instantly goes HIGH.

Next Clock Edge → State updates to idle, detected goes LOW.Overview This repository contains the Verilog RTL implementation and testbench for a synchronous 1110 Sequence Detector. The module is designed using a Mealy Machine Finite State Machine (FSM) architecture. It continuously monitors a 1-bit serial data stream and asserts an output flag high immediately upon detecting the specific binary pattern 1110.
Key Features Mealy Architecture: The output is determined by both the current state and the current input, allowing for instant, zero-latency detection.

Synchronous Reset: Includes an active-high synchronous reset to safely initialize the FSM to its default state.

Robust Pattern Handling: Smart state logic that resets on broken patterns but safely holds its state if consecutive 1s exceed the pattern requirements.

Zero-Latency Pulse: Generates a precise half-cycle pulse upon successful detection before returning to the idle state.

Port Interface clk (Input): System clock. All state transitions occur on the positive edge.

rst (Input): Synchronous active-high reset. Forces the FSM to the initial state when high.

din (Input): 1-bit serial data input stream.

detected (Output): 1-bit output flag. Asserts to 1 the moment 1110 is detected.

State Machine Encoding The design utilizes a 4-state architecture to track the progress of the incoming sequence:

idle (2'b00): Initial state. No relevant prefix detected.

s1 (2'b01): Valid prefix 1 detected.

s2 (2'b10): Valid prefix 11 detected.

s3 (2'b11): Valid prefix 111 detected.

State Transition Logic Because the target sequence (1110) relies on a continuous string of 1s, the state machine handles unexpected bits as follows:

Breaking the Pattern: If a 0 is received while the machine is building its prefix in states s1 or s2, the pattern is broken, and the FSM drops immediately back to the idle state.

Holding on Extra Ones: If the machine is holding three ones in state s3 and receives an additional 1 (forming 1111), it safely holds its position in s3. The last three bits still form a valid 111 prefix, allowing it to wait indefinitely for the final 0.

Successful Detection: When a 0 is received while the FSM is in state s3, the detected output is instantly driven high via combinational logic. On the next positive clock edge, the FSM transitions back to idle, returning the output to 0.

Example Timing Flow If the input stream receives 0 -> 1 -> 1 -> 1 -> 0:

din = 1 → State shifts idle to s1

din = 1 → State shifts s1 to s2

din = 1 → State shifts s2 to s3

din = 0 → detected instantly goes HIGH.

Next Clock Edge → State updates to idle, detected goes LOW.
