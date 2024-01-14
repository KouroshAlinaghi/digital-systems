`timescale 1ns/1ns
module LUT(input [3:0] index, output [7:0] key);
	assign key = (index == 1) ? 8'b11111111 :
		     (index == 2) ? 8'b10000000 :
		     (index == 3) ? 8'b01010101 :
		     (index == 4) ? 8'b01000000 :
		     (index == 5) ? 8'b00110011 :
		     (index == 6) ? 8'b00101010 :
		     (index == 7) ? 8'b00100100 :
		     (index == 8) ? 8'b00100000 :
		     (index == 9) ? 8'b00011100 :
		     (index == 10) ? 8'b00011001 :
		     (index == 11) ? 8'b00010111 :
		     (index == 12) ? 8'b00010101 :
		     8'b00000000;
endmodule