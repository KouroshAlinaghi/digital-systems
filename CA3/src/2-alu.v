`timescale 1ns/1ns
module ALUL2(input [15:0] inA, inB, input inC, input [2:0] opc, output reg [15:0] outW, output reg zer, neg);
	reg [15:0] addFirst, addSecond;
	reg [15:0] shiftedB;
	assign shiftedB = inB >> 1;
	assign addFirst = (opc == 3'b000) ? ~inA : inA;
	assign addSecond = (opc == 3'b010) ? (inB + inC) :
					   (opc == 3'b011) ? ({inB[15], shiftedB[14:0]}) :
					   1'b1;
	
	always @(opc, inA, inB, inC, outW) begin
		outW = 0;
		zer = 0;
		neg = 0;

		case (opc)
			4: outW = inA & inB;
			5: outW = inA | inB;
			6: outW = {inA[7:0], inB[7:0]};
			7: outW = 0;
			default: outW = addFirst + addSecond;
		endcase

		zer = outW == 0;
		neg = outW[15];
	end
endmodule