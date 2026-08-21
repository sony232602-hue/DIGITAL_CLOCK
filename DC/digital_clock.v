//============================================================
// Project    : Digital Clock Using Verilog HDL
// File       : digital_clock.v
// Description: 24-hour digital clock with reset
//============================================================

`timescale 1ns/1ps

module digital_clock #(
    parameter CLK_FREQ = 50_000_000
)(
    input  wire       clk,
    input  wire       reset,

    output reg [4:0]  hours,
    output reg [5:0]  minutes,
    output reg [5:0]  seconds
);

    // Clock divider counter
    reg [31:0] clk_counter;

    //========================================================
    // Clock Divider
    // Converts input clock into a 1 Hz timing pulse
    //========================================================

    always @(posedge clk) begin

        if (reset) begin

            clk_counter <= 32'd0;
            hours       <= 5'd0;
            minutes     <= 6'd0;
            seconds     <= 6'd0;

        end
        else begin

            // Generate 1-second timing interval
            if (clk_counter == CLK_FREQ - 1) begin

                clk_counter <= 32'd0;

                //================================================
                // Seconds Counter
                //================================================

                if (seconds == 6'd59) begin

                    seconds <= 6'd0;

                    //============================================
                    // Minutes Counter
                    //============================================

                    if (minutes == 6'd59) begin

                        minutes <= 6'd0;

                        //========================================
                        // Hours Counter
                        //========================================

                        if (hours == 5'd23)
                            hours <= 5'd0;
                        else
                            hours <= hours + 5'd1;

                    end
                    else begin

                        minutes <= minutes + 6'd1;

                    end

                end
                else begin

                    seconds <= seconds + 6'd1;

                end

            end
            else begin

                clk_counter <= clk_counter + 32'd1;

            end

        end

    end

endmodule
