module gates_dataflow (
	input wire a,b,c
	output wire y_and, y_nand,  y_or, y_xor, y_not, y_xnor
);

	assign y_and = a & b
	assign y_nand = ~(a&b&c)
	assign y_or = a | b
	assign y_xor = a ^ b
	assign y_xnor = a ~^ b
	assign y_not = ~a	
endmodule
