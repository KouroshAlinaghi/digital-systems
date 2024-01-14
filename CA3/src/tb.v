`timescale 1ns/1ns;
module ALUTB;
    logic [15:0] A, B;
    logic C;
    logic [2:0] opc;
    wire [15:0] out;
    wire zer, neg;

    ALUL1 uut(.opc(opc), .inA(A), .inB(B), .inC(C), .outW(out), .zer(zer), .neg(neg));

    initial begin
        A = 16'b0;
        B = 16'b0;
        C = 2'b0;
        opc = 3'b0;

	    repeat (100) #200 begin
	        A = $random() % 16'b1111111111111111;
	        B = $random() % 16'b1111111111111111;
	        C = $random() % 2'b10;
	        opc = $random() % 3'b111;
	    end

	    $stop;
	end

endmodule;