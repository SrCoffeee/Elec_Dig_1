`timescale 1ns / 1ps
module sumador1bit (
	// Declaracion de entradas
	input a,b,cin,
	// Declaracion de salidas
	output sum, cout
);
 // logica combinacional de salidas respecto a entradas

assign sum  = (a ^ b) ^ cin;
assign cout = (a & b) | (b & cin) | (cin & a);

endmodule
