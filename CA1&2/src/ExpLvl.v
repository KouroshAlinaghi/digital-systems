`timescale 1ns/1ns
module ExpressionLevelOneCounter(input a, b, c, output y0, y1);
	assign #20 y0 = (a & ((b & c) | (~b & ~c))) | (~a & ((b & ~c) | (~b & c)));
	assign #15 y1 = (a & b) | (b & c) | (a & c);
endmodule