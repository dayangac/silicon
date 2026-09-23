module gates_structural (
	input wire a,b,c
	output wire y_and, y_nand3, y_or, y_xor, y_not
	);

	and g1 (y_and, a, b)
	nand g2 (y_nand3, a, b, c)
	or g3 (y_or, a, b)
	xor g4 (y_xor, a, b)
	not g5 (y_not, a, b)
endmodule