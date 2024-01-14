`timescale 1ns/1ns
module DownCounter(input clk, rst, dcen, ld, input [7:0] pi, output co);
	reg [7:0] po = 8'b0;
	always @(posedge clk, posedge rst) begin
		if (rst)
			po <= 8'b0;
		else if (ld)
			po <= pi;
		else begin
			if (dcen)
				po <= po - 1;
			else
				po <= po;
		end
	end

	assign co = po == 1;
endmodule