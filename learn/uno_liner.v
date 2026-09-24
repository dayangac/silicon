// single liner large mux
module mux256to1 (input wire [255:0] in, input wire [7:0] sel, output wire out);
	// assigns the selected bit in "in" to out
	assign out = in[sel];
endmodule

// 4 bit groups
module mux256to1v (input wire [1023:0], input wire [7:0] sel, output wire [3:0] out);
	assign out = in[sel * 4 + 4]
endmodule