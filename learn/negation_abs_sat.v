module neg_abs_sat #(parameter N = 8)(
	input wire signed [N-1:0] x, // the input number
	output wire signed [N-1:0] neg, // -x
	output wire [N-1:0] abs_u // abs(x)
	output wire signed [N-1:0] // neg_sat 
);

  localparam signed [N-1:0] MAX_POS = {1'b0, {(N-1){1'b1}}};
  localparam signed [N-1:0] MIN_NEG = {1'b1, {(N-1){1'b0}}};
  assign neg     = -x;                           
  assign abs_u   = x[N-1] ? -x : x; //basically and abs if N-1 is one it is negative then -x and ? is the left side since that is the true side and then if false it is 0 and it is just x that is postive
   assign neg_sat = (x == MIN_NEG) ? MAX_POS : -x;
endmodule
