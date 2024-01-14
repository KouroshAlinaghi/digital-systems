`timescale 1ns/1ns
module CosAccelTB;
	reg clk = 0;
  	reg rst = 0;
  	reg start = 0;
  	reg [15:0] x_bus;
  	reg [7:0] y_bus;
  	wire [15:0] out_bus_pre, out_bus_post;

	CosAccel UUT1(clk, rst, start, x_bus, y_bus, out_bus_pre);
	CosAccelPost UUT2(clk, rst, start, x_bus, y_bus, out_bus_post);

	initial begin
    	repeat (1000) #(300) clk = ~clk;
  	end

  	initial begin
        x_bus = 16'b00000010_00000000;
        y_bus = 8'b0000001;
        #1;
        rst = 1;
        #1;
        rst = 0;
        #398 start = 1;
        #1400 start = 0;
        #20000;

	    $stop;
  	end
endmodule