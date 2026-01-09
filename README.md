# Traffic-light-controller

📖 Overview

This project implements a Traffic Light Controller using a Finite State Machine (FSM) in Verilog. The controller manages traffic signals for a junction by transitioning through predefined states based on clock and reset inputs, ensuring safe and orderly traffic flow.

⚙️ Features

FSM-based traffic light control logic

Clearly defined states for Red, Yellow, and Green

Synchronous operation with clock and reset

Deterministic state transitions

Fully synthesizable RTL design

Simple and modular Verilog implementation

🧠 Design Details

Designed using a Moore-type FSM

Each state represents a traffic signal condition

State transitions occur on the positive edge of the clock

Reset initializes the controller to a safe default state (Red)

Output signals are derived from the current state

<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/ae1bd311-12de-4488-898f-0f7f28247476" />


🧪 Verification

Verified through RTL simulation

Testbench applies clock and reset stimulus

Validated correct state transitions and output behavior

Waveform analysis used to confirm timing correctness
<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/9fe8ff67-e9dd-4f8b-ace8-e078a743e28e" />


🛠️ Tools Used

HDL: Verilog

Simulation: Xilinx Vivado 

Synthesis: Xilinx Vivado
