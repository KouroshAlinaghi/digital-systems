`timescale 1ns/1ns
module P1Testbench();
	logic s, r, w_up = 1, w_down = 1;
	wire q, q_bar;

	SRLatch UUT(s, r, w_up, w_down, q, q_bar);

	initial begin
		s = 1;
		r = 1;
		#80
		r = 0;
		#80
		r = 1;
		s = 0;
		#80
		s = 1;
		#200

		$stop;
	end
endmodule