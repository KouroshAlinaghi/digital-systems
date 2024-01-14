`timescale 1ns/1ns
module Controller(input clk, rst, seqValid, co3, co8, output iz_cnt, cen3, shen, dcen, ld, outputValid);
	parameter [1:0] seqDetection = 2'b00, readingNumber = 2'b01, transmittingOutput = 2'b10;
	reg [1:0] state = seqDetection, nextState = seqDetection;

	reg iz_cnt_reg = 0, cen3_reg = 0, shen_reg = 0, dcen_reg = 0, ld_reg = 0;

	assign iz_cnt = iz_cnt_reg;
	assign cen3 = cen3_reg;
	assign shen = shen_reg;
	assign dcen = dcen_reg;
	assign ld = ld_reg;

	always @(state, seqValid, co3, co8) begin
		iz_cnt_reg = 0;
		cen3_reg = 0;
		shen_reg = 0;
		dcen_reg = 0;
		ld_reg = 0;
		case (state)
			seqDetection: begin
				iz_cnt_reg = 1;
				if (seqValid) begin
					shen_reg = 1;
					nextState = readingNumber;
				end
			end

			readingNumber: begin
				cen3_reg = 1;
				shen_reg = 1;
				if (co3) begin
					nextState = transmittingOutput;
					ld_reg = 1;
				end
			end

			transmittingOutput: begin
				dcen_reg = 1;
				if (co8) begin
					nextState = seqDetection;
				end
			end

			default: nextState = seqDetection;
		endcase
	end

	assign outputValid = state == transmittingOutput;

	always @(posedge clk, posedge rst) begin
		if (rst)
			state <= seqDetection;
		else
			state <= nextState;
	end
endmodule