`timescale 1ns/1ns
module MainCircuit(input serIn, clk, rst, output serOut, outputValid);
	wire seqValid, iz_cnt, cen3, shen, co3, dcen, ld, co8;
	wire [7:0] po;

	SeqDet seq_det(clk, serIn, rst, seqValid);
	GetInputNumber get_inp_numb(iz_cnt, cen3, shen, clk, rst, serIn, co3, po);
	DownCounter down_cnt(clk, rst, dcen, ld, po, co8);
	Controller cont(clk, rst, seqValid, co3, co8, iz_cnt, cen3, shen, dcen, ld, outputValid);

	assign serOut = outputValid ? serIn : 1'bz;
endmodule