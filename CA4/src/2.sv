`timescale 1ns/1ns
module DFlipFlop(input d, clk, output q, q_bar);
	wire w1, w2, w3, w4;
	SRLatch U(w4, clk, 1, 1, w1, w2);
	SRLatch D(clk, d, w2, 1, w3, w4);
	SRLatch R(w2, w3, 1, 1, q, q_bar);
endmodule