`timescale 1ns/1ns
module TransistorLevelOneCounter(input a, b, c, output y0, y1);
	supply1 VDD;
	supply0 GND;

	wire w1, w2;
	
	pmos #(5, 6, 7) (w1, VDD, ~a);
	
	pmos #(5, 6, 7) (y1, w1, ~b);
	pmos #(5, 6, 7) (y1, w1, ~c);

	pmos #(5, 6, 7) (w2, VDD, ~b);
	pmos #(5, 6, 7) (y1, w2, ~c);

	wire w3, w4;
	
	nmos #(3, 4, 5) (w3, GND, ~b);
	nmos #(3, 4, 5) (w4, w3, ~c);

	nmos #(3, 4, 5) (w4, GND, ~a);
	
	nmos #(3, 4, 5) (y1, w4, ~b);
	nmos #(3, 4, 5) (y1, w4, ~c);

	wire w5, w6, w7;

	pmos #(5, 6, 7) (w5, VDD, ~b);
	pmos #(5, 6, 7) (w6, w5, ~c);
	
	pmos #(5, 6, 7) (w7, VDD, b);
	pmos #(5, 6, 7) (w6, w7, c);

	pmos #(5, 6, 7) (y0, w6, ~a);

	wire w8, w9, w10;

	pmos #(5, 6, 7) (w8, VDD, b);
	pmos #(5, 6, 7) (w9, w8, ~c);
	
	pmos #(5, 6, 7) (w10, VDD, ~b);
	pmos #(5, 6, 7) (w9, w10, c);

	pmos #(5, 6, 7) (y0, w9, a);

	
	wire w11, w12;

	nmos #(3, 4, 5) (w11, GND, a);

	nmos #(3, 4, 5) (w12, GND, ~b);
	nmos #(3, 4, 5) (w12, GND, c);

	nmos #(3, 4, 5) (w11, w12, b);
	nmos #(3, 4, 5) (w11, w12, ~c);

	wire w13;

	nmos #(3, 4, 5) (y0, w11, ~a);

	nmos #(3, 4, 5) (w13, w11, b);
	nmos #(3, 4, 5) (w13, w11, c);

	nmos #(3, 4, 5) (y0, w13, ~b);
	nmos #(3, 4, 5) (y0, w13, ~c);
endmodule