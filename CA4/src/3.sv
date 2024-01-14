`timescale 1ns/1ns
module DFlipFlopP3(input d, clk, pre, clr, output q, q_bar);
	wire w1, w2, w3, w4;
	SRLatch U(w4, ~clr, ~pre, clk, w1, w2);
	SRLatch D(clk, ~clr, w2, d, w3, w4);
	SRLatch R(w2, ~clr, ~pre, w3, q, q_bar);
endmodule