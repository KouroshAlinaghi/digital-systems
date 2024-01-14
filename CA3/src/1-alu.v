`timescale 1ns/1ns
module ALUL1(input [15:0] inA, inB, input inC, input [2:0] opc, output reg [15:0] outW, output reg zer, neg);
	reg [15:0] shiftedB;
	assign shiftedB = inB >> 1;
	
	always @(opc, inA, inB, inC, outW) begin
		outW = 0;
		zer = 0;
		neg = 0;
		case (opc)
			0: outW = ~inA + 1;
			1: outW = inA + 1;
			2: outW = inA + inB + inC;
			3: outW = inA + ({inB[15], shiftedB[14:0]});
			4: outW = inA & inB;
			5: outW = inA | inB;
			6: outW = {inA[7:0], inB[7:0]};
		endcase

		zer = outW == 0;
		neg = outW[15];
	end
endmodule