`timescale 1ns/1ns
module P2Testbench();
	logic d, clk;
	wire q, q_bar;

	DFlipFlop UUT(d, clk, q, q_bar);

	initial begin
		d = 0;
		clk = 0;
		#80
		clk = 1;
		#1
		d = 1;
		#80;
		clk = 0;
		#80
		d = 1;
		#80
		clk = 1;
		#80
		d = 0;
		#80;
		clk = 0;
		#80
		d = 1;
		#1
		clk = 1;
		#200

		$stop;
	end
endmodule