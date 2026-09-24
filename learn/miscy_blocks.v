module misc_blocks (
	input wire [7:0] a, b,
	output wire 	even_parity, //do are ones have an even number of ones or
	output wire 	eq, lt // eq for if a=b lt for if a<b
);
	assign even_parity = ~^a;
	assign eq = (a == b);
	assign lt = (a < b);
endmodule