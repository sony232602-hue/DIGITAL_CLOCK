Digital Clock Using Verilog HDL
Overview

This project implements a Digital Clock using Verilog HDL. The clock displays time in HH:MM:SS format and continuously increments the time using a clock signal.

The design uses counters for seconds, minutes, and hours. A clock divider is used to generate a 1 Hz timing signal from a high-frequency input clock.

This project demonstrates RTL design, digital counters, clock division, simulation, and functional verification using Verilog HDL.

Objectives
Design a digital clock using Verilog HDL.
Generate a 1 Hz timing signal from a system clock.
Implement seconds, minutes, and hours counters.
Display time in HH:MM:SS format.
Implement reset functionality.
Verify the design using a Verilog testbench.
Analyze the simulation waveform.
Features
24-hour digital clock.
Hours range from 00 to 23.
Minutes range from 00 to 59.
Seconds range from 00 to 59.
Automatic time increment.
Reset functionality.
Synthesizable Verilog design.
Testbench for simulation and verification.
Suitable for FPGA implementation.
Block Diagram
                    +----------------+
                    |                |
System Clock ------>| Clock Divider  |
                    |                |
                    +-------+--------+
                            |
                           1 Hz
                            |
                            v
                    +---------------+
                    | Seconds       |
                    | Counter       |
                    | 00 - 59       |
                    +-------+-------+
                            |
                            v
                    +---------------+
                    | Minutes       |
                    | Counter       |
                    | 00 - 59       |
                    +-------+-------+
                            |
                            v
                    +---------------+
                    | Hours         |
                    | Counter       |
                    | 00 - 23       |
                    +-------+-------+
                            |
                            v
                      HH : MM : SS

Working Principle

The digital clock receives a high-frequency clock signal from the FPGA or simulation environment.

The clock divider reduces the input clock frequency to 1 Hz. This means one pulse is generated every second.

The seconds counter increments on every 1 Hz pulse.

00 → 01 → 02 → ... → 58 → 59 → 00


When seconds reach 59, they return to 00 and the minutes counter increases by one.

Similarly, when minutes reach 59, they return to 00 and the hours counter increases by one.

The hours counter operates in 24-hour format:

00 → 01 → 02 → ... → 22 → 23 → 00

Time Format

The output time is represented as:

HH : MM : SS


Example:

14 : 35 : 27


This represents:

Hours = 14
Minutes = 35
Seconds = 27
Counter Operation
Counter	Minimum	Maximum	Next Value
Seconds	00	59	00
Minutes	00	59	00
Hours	00	23	00
Project Structure
digital-clock-verilog/
│
├── README.md
│
├── rtl/
│   └── digital_clock.v
│
├── tb/
│   └── digital_clock_tb.v
│
├── simulation/
│   └── digital_clock_waveform.png
│
└── docs/
    └── project_report.pdf

Module Description
Module Name

digital_clock

Inputs
Signal	Width	Description
clk	1 bit	System clock
reset	1 bit	Resets the clock to 00:00:00
Outputs
Signal	Width	Description
hours	5 bits	Hour value, 0–23
minutes	6 bits	Minute value, 0–59
seconds	6 bits	Second value, 0–59
Simulation

The project can be simulated using Icarus Verilog and the waveform can be viewed using GTKWave.

Compile

From the project root:

iverilog -o digital_clock_sim rtl/digital_clock.v tb/digital_clock_tb.v

Run Simulation
vvp digital_clock_sim


The testbench generates a VCD waveform file.

Open Waveform
gtkwave digital_clock.vcd


Add the following signals in GTKWave:

clk
reset
hours
minutes
seconds

Expected Simulation

After reset, the clock starts at:

00 : 00 : 00


The time then increments:

00 : 00 : 00
00 : 00 : 01
00 : 00 : 02
...
00 : 00 : 59
00 : 01 : 00
...
00 : 59 : 59
01 : 00 : 00


After reaching:

23 : 59 : 59


the clock rolls over to:

00 : 00 : 00

Simulation Result

The expected waveform should demonstrate:

Correct clock division.
Seconds incrementing every second.
Seconds resetting after 59.
Minutes incrementing after seconds reach 59.
Minutes resetting after 59.
Hours incrementing after 59 minutes and 59 seconds.
Hours resetting from 23 to 00.
Correct reset operation.

A waveform screenshot can be stored as:

simulation/digital_clock_waveform.png

Applications

Digital clock circuits are used in:

Digital watches
Alarm clocks
Electronic appliances
Industrial control systems
FPGA-based projects
Embedded systems
Digital dashboards
Timing and monitoring systems
Advantages
Simple RTL implementation.
Accurate digital time counting.
Easy to simulate and verify.
Can be implemented on an FPGA.
Can be extended with additional features.
Demonstrates counters and clock-divider concepts.
Future Improvements

The project can be extended by adding:

Seven-segment display output.
Alarm functionality.
Stopwatch mode.
Countdown timer.
12-hour AM/PM mode.
Push-button time adjustment.
Date and day display.
Real-time clock module.
FPGA board implementation.
Technologies Used
Verilog HDL
Icarus Verilog
GTKWave
Git
GitHub
Conclusion

This project demonstrates the design and simulation of a Digital Clock using Verilog HDL. The system uses a clock divider and counters to generate and maintain hours, minutes, and seconds in a 24-hour format.

The project provides practical experience with RTL design, sequential logic, counters, clock division, testbench development, and waveform analysis.

Author

Your Name

Digital Electronics / VLSI / FPGA Project

License

This project is intended for educational and learning purposes.