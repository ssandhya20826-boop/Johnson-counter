`timescale 1ns/1ps

module johnson_counter_tb;

    parameter WIDTH = 4;

    reg clk;
    reg reset;
    wire [WIDTH-1:0] q;

    johnson_counter #(
        .WIDTH(WIDTH)
    ) uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        reset = 1;

        #12;
        reset = 0;

        #100;

        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time = %0t | Reset = %b | Q = %b",
                 $time, reset, q);
    end

endmodule