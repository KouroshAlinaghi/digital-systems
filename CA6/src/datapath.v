`timescale 1ns/1ns
module Datapath(input clk, rst, input [15:0] x_bus, input [7:0] y_bus, 
	input ld_x, ld_y, ld_term, iz_term, mux_sel, neg, ld_ans, iz_ans, input [3:0] index,
	output less, output [15:0] out_bus
	);

	reg [15:0] x_reg = 0, y_reg = 0, term_reg = 0, ans_reg = 0;
	wire [15:0] mult_wire, rom_wire, sum_wire, add_rhs_wire, mult_rhs_wire;

	// X Register
	always @(posedge clk, posedge rst) begin
		if (rst)
			x_reg <= 16'b0;
		else begin
			if (ld_x)
				x_reg <= x_bus;
			else
				x_reg <= x_reg;
		end
	end

	// Y Register
	always @(posedge clk, posedge rst) begin
		if (rst)
			y_reg <= 16'b0;
		else begin
			if (ld_y)
				y_reg <= {8'b0, y_bus};
			else
				y_reg <= y_reg;
		end
	end

	// Term Register
	always @(posedge clk, posedge rst) begin
		if (rst)
			term_reg <= 16'b0;
		else begin
			if (ld_term)
				term_reg <= mult_wire;
			else begin
				if (iz_term)
					term_reg <= 16'b0000000100000000;
				else
					term_reg <= term_reg;
			end
		end
	end

	// Answer Register
	always @(posedge clk, posedge rst) begin
		if (rst)
			ans_reg <= 16'b0;
		else begin
			if (ld_ans)
				ans_reg <= sum_wire;
			else begin
				if (iz_ans)
					ans_reg <= 16'b0000000100000000;
				else
					ans_reg <= ans_reg;
			end
		end
	end

	// ROM
	wire [7:0] rom_8_bit_out;
	LUT rom_lut(index, rom_8_bit_out);
	assign rom_wire = {8'b0, rom_8_bit_out};

	// Multiplier
	reg [31:0] mult_product_reg_32;
	reg [15:0] mult_product_reg_16;
	assign mult_rhs_wire = mux_sel ? rom_wire : x_reg;
	always @(term_reg, mult_rhs_wire) begin
		mult_product_reg_32 = term_reg * mult_rhs_wire;
		mult_product_reg_16 = mult_product_reg_32[23:8];
	end
	assign mult_wire = mult_product_reg_16;

	// Adder
	assign add_rhs_wire = neg ? ~term_reg : term_reg;
	assign sum_wire = ans_reg + add_rhs_wire + neg;

	// Comperator
	assign less = term_reg < y_reg;

	assign out_bus = ans_reg;
endmodule