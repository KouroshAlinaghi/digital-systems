`timescale 1ns/1ns
module P3Testbench();
	logic d, clk, pre, clr;
	wire q, q_bar;

	DFlipFlopP3 UUT(d, clk, pre, clr, q, q_bar);

	initial begin
		d = 0;
		clk = 0;
		pre = 0;
		clr = 0;

		#80
		clk = 1;
		#80
		clk = 0;
		#80
		pre = 1;
		#80
		pre = 0;
		#80
		clr = 1;
		#80
		clk = 1;
		#80
		clr = 1;
		pre = 1;
		#80

		#200

		$stop;
	end
endmodule