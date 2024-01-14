`timescale 1ns/1ns
module SRLatch(input s, r, w_up, w_down, output q, q_bar);
	nand #12 (q, s, w_up, q_bar);
	nand #12 (q_bar, r, w_down, q);
endmodule