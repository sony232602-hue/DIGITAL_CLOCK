//============================================================
// Project    : Digital Clock Using Verilog HDL
// File       : digital_clock_tb.v
// Description: Testbench for 24-hour Digital Clock
//============================================================

`timescale 1ns/1ps

module digital_clock_tb;

    // Testbench signals
    reg clk;
    reg reset;

    wire [4:0] hours;
    wire [5:0] minutes;
    wire [5:0] seconds;

    //========================================================
    // Instantiate Digital Clock
    // CLK_FREQ = 10 for faster simulation
    //========================================================

    digital_clock #(
        .CLK_FREQ(10)
    ) uut (
        .clk     (clk),
        .reset   (reset),
        .hours   (hours),
        .minutes (minutes),
        .seconds (seconds)
    );

    //========================================================
    // Clock Generation
    // 10 ns clock period
    //========================================================

    initial begin
        clk = 1'b0;

        forever #5 clk = ~clk;
    end

    //========================================================
    // Test Sequence
    //========================================================

    initial begin

        // Create waveform file
        $dumpfile("digital_clock.vcd");
        $dumpvars(0, digital_clock_tb);

        // Initial reset
        reset = 1'b1;

        #20;

        // Release reset
        reset = 1'b0;

        // Run simulation
        #7000;

        // End simulation
        $display("---------------------------------------");
        $display(" Digital Clock Simulation Completed");
        $display("---------------------------------------");

        $finish;

    end

    //========================================================
    // Display Clock Values
    //========================================================

    initial begin

        $monitor(
            "Time = %0t ns | Reset = %b | Clock = %02d:%02d:%02d",
            $time,
            reset,
            hours,
            minutes,
            seconds
        );

    end

endmodule
