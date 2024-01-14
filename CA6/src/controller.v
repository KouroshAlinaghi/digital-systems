`timescale 1ns/1ns
module Controller(input clk, rst, start, less,
	output ld_x, ld_y, ld_term, iz_term, mux_sel, neg, ld_ans, iz_ans, output [3:0] index
	);

	parameter [2:0] idle = 0, waiting = 1, initalization = 2, multipy = 3, divide = 4, update_ans = 5;
	reg [2:0] state = idle, nextState = idle;

	reg ld_x_reg = 0, ld_y_reg = 0, ld_term_reg = 0, iz_term_reg = 0, mux_sel_reg = 0, neg_reg = 0, ld_ans_reg = 0, iz_ans_reg = 0;

	assign ld_x = ld_x_reg;
	assign ld_y = ld_y_reg;
	assign ld_term = ld_term_reg;
	assign iz_term = iz_term_reg;
	assign ld_ans = state == update_ans;
	assign iz_ans = iz_ans_reg;
	assign mux_sel = mux_sel_reg;
	assign neg = neg_reg;

	reg cen, iz_cnt;
	reg [3:0] cnt_val = 4'b0;

	assign index = cnt_val;

	// Counter
	always @(posedge clk, posedge rst) begin
		if (rst)
			cnt_val <= 4'b0;
		else begin
			if (iz_cnt)
				cnt_val <= 4'b0;
			else begin
				if (cen)
					cnt_val <= cnt_val + 1;
				else
					cnt_val <= cnt_val;
			end
		end
	end

	always @(state, start, less) begin
		cen = 0;
		iz_cnt = 0;
		ld_x_reg = 0;
		ld_y_reg = 0;
		ld_term_reg = 0;
		iz_term_reg = 0;
		mux_sel_reg = 0;
		neg_reg = 0;
		ld_ans_reg = 0;
		iz_ans_reg = 0;

		case (state)
			idle: begin
				if (start)
					nextState = waiting;
			end

			waiting: begin
				if (~start)
					nextState = initalization;
			end

			initalization: begin
				ld_x_reg = 1;
				ld_y_reg = 1;
				iz_cnt = 1;
				iz_term_reg = 1;
				iz_ans_reg = 1;

				nextState = multipy;
			end

			multipy: begin
				ld_term_reg = 1;
				cen = 1;
				nextState = divide;
			end

			divide: begin
				mux_sel_reg = 1;
				ld_term_reg = 1;
				if (cnt_val[0])
					nextState = multipy;
				else
					nextState = update_ans;
			end

			update_ans: begin
				if (less)
					nextState = idle;
				else begin
					ld_ans_reg = 1;
					nextState = multipy;
					if (cnt_val[1:0] == 2'b10)
						neg_reg = 1;
				end
			end
		
			default: nextState = idle;
		endcase
	end

	always @(posedge clk, posedge rst) begin
		if (rst)
			state <= idle;
		else
			state <= nextState;
	end
endmodule