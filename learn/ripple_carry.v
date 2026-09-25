module rca #(parameter N=8) (
	input wire [N-1:0] a,b
	input wire 		   cin
	input wire [N-1:0] s,
	output wire 	   cout
)

	wire [N:0] c
	assign c[0] = cin;
	genvar i;
	generate 
		for (i = 0; i < N; i = i + 1) begin: fa_bit
			fa_dataflow u (.a(a[i]), .b(b[i]), .cin(c[i]), .s(s[i]), .cout(c[i+1]));
		end
	endgenerate
	assign cout = c[N]
endmodule
