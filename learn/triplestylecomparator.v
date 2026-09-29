//gate with XNOR and AND
module eq4_gates (input wire [3:0] a,b, output wire eq);
	wire [3:0] x;
	xnor(x[0],a[0],b[0]);
	xnor(x[1],a[1],b[1]);
	xnor(x[2],a[2],b[2]);
	xnor(x[3],a[3],b[3]);
	and(eq,x[0],x[1],x[2],x[3]);
endmodule

//dataflow relational operators 

module cmp #(parameter N=8)(
	input wire [N-1:0] a,b
	output wire eq, ltu, lts
);
	assign eq = (a==b);
	assign ltu = (a<b)
	assign lts = ($signed(a) < $signed(b));
endmodule

//comp from subtr
module cmp_via_sub #(parameter N=8) (
	input wire [N-1:0] a,b
	output wire eq, ltu, lts
	);
	wire [N:0] d = {1'b0,a} + {1'b0, b} + 1'b1;
	wire	   cout = d[N];
	wire	   neg = d[N-1];
	wire ovf = (a[N-1] != b[N-1]) && (neg != a[N-1]); /*first one is kinda like a precnd as if it is true it is impposible for overflow
	second is true since a and result differs in sign when the signs of the objects are different that means a wrap */
	assign eq = (d[N-1:0] == 0);
	assign ltu = ~cout;
	assign lts = neg ^ ovf;
endmodule