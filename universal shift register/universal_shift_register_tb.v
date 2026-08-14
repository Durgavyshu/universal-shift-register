`timescale 1ns/1ps

module universal_shift_register_tb;

reg clk;
reg reset;
reg [1:0] sel;
reg [3:0] parallel_in;
reg serial_left;
reg serial_right;
wire [3:0] q;

universal_shift_register uut (
    .clk(clk),
    .reset(reset),
    .sel(sel),
    .parallel_in(parallel_in),
    .serial_left(serial_left),
    .serial_right(serial_right),
    .q(q)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    $dumpfile("shift_reg.vcd");
    $dumpvars(0, universal_shift_register_tb);

    clk = 0;
    reset = 1;
    sel = 2'b00;
    parallel_in = 4'b0000;
    serial_left = 0;
    serial_right = 0;

    #10;
    reset = 0;

    // Parallel Load: 1010
    sel = 2'b11;
    parallel_in = 4'b1010;
    #10;

    // Shift Right
    sel = 2'b01;
    serial_right = 1;
    #10;

    // Shift Left
    sel = 2'b10;
    serial_left = 0;
    #10;

    // Hold
    sel = 2'b00;
    #10;

    $finish;
end

initial begin
    $monitor("Time=%0t Reset=%b Sel=%b Parallel=%b Q=%b",
             $time, reset, sel, parallel_in, q);
end

endmodule