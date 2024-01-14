`timescale 1ns/1ns
module SevenInputOneCounter(input a0, a1, a2, a3, a4, a5, a6, output y0, y1, y2);
	wire w1, w2, w3, w4, w5, w6, w7;

	ExpressionLevelOneCounter OC1(a0, a1, a2, w1, w2);
	ExpressionLevelOneCounter OC2(a3, a4, a5, w3, w4);
	ExpressionLevelOneCounter OC3(w1, w3, a6, y0, w5);
	ExpressionLevelOneCounter OC4(w4, w2, w5, y1, y2);
endmodule