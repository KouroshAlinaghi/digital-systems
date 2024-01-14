`timescale 1ns/1ns
module GateLevelOneCounter(input a, b, c, output y0, y1);
	wire w1, w2, w3, w4, w5, w6, w7, w8;

	nand #5 (w1, b, c);
	nand #5 (w2, ~b, ~c);
	nand #5 (w3, w1, w2);
	nand #5 (w4, a, w3);

	nand #5 (w5, b, ~c);
	nand #5 (w6, ~b, c);
	nand #5 (w7, w5, w6);
	nand #5 (w8, ~a, w7);

	nand #5 (y0, w8, w4);

	wire w9, w10, w11;

	nand #5 (w9, a, b);
	nand #5 (w10, b, c);
	nand #5 (w11, a, c);

	nand #10 (y1, w9, w10, w11);
endmodule