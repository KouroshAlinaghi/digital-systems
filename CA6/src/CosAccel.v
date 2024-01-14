`timescale 1ns/1ns
module CosAccel(input clk, rst, start, input [15:0] x_bus, input [7:0] y_bus, output [15:0] out_bus);
	wire [3:0] index;
	wire less, ld_x, ld_y, ld_term, iz_term, ld_ans, iz_ans, mux_sel, neg;

	Controller cont(clk, rst, start, less, ld_x, ld_y, ld_term, iz_term, mux_sel, neg, ld_ans, iz_ans, index);
	Datapath dp(clk, rst, x_bus, y_bus, ld_x, ld_y, ld_term, iz_term, mux_sel, neg, ld_ans, iz_ans, index, less, out_bus);
endmodule