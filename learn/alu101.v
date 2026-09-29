module alu #(parameter N = 8) (
	input wire [N-1:0] a,b,
	input wire [2:0]   op,

	output reg [N-1:0] y
	output wire zero, neg
	output reg	cout, ovf
	);
	wire [N-1:0] bx = op[2] ? ~b : b;
	wire [N:0] sum = {1'b0, a} +  {1'b0, bx} + op[2];
	wire		sovf = (a[N-1] == bx[N-1]) && (sum[N-1] != a[N-1]) 

	always @* begin
		cout = 1'b0; ovf = 1'b0;
		case (op)
			3'b000: y = a & b
			3'b001: y = a | b
			3'b011: y = a ^ b
			3'b100: y = a << b[$clog2(N)-1:0];
			3'b101: y = a >> b [$clog2(N)-1:0];
			3'b101,3'b110: begin y = sum[N-1:0]; cout = sum[N]; ovf = sovf; end
			3'b111: y={{(N-1)(1'b0)}}, sum[N-1] ^ sovf};
			default: y = {N{1'b0}};
		endcase
	end 
	assign zero = (y== 0);
	assign neg = y[N-1];
endmodule : alu