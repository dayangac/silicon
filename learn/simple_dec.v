module dec3to8 (input wire en, input wire [2:0] a, output wire [7:0] y);
	assign y = en ? (8'b1 << a): 8'b0;
endmodule