`timescale 1ns/1ns
module GetInputNumber(input iz_cnt, cen, shen, clk, rst, serin, output co, output [7:0] po);
	reg [2:0] cnt_po = 3'b0;
	always @(posedge clk, posedge rst) begin
		if (rst)
			cnt_po <= 3'b0;
		else if (iz_cnt)
			cnt_po <= 3'b0;
		else begin
			if (cen)
				cnt_po <= cnt_po + 1;
			else
				cnt_po <= cnt_po;
		end
	end

	assign co = &{cnt_po};

	reg [7:0] shf_po = 8'b0;
	always @(posedge clk, posedge rst) begin
		if (rst)
			shf_po <= 8'b0;
		else begin
			if (shen)
				shf_po <= {serin, shf_po[7:1]};
			else
				shf_po <= shf_po;
		end
	end

	assign po = shf_po;
endmodule