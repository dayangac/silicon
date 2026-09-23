module bool_dataflow (input wire a,b,c output wire y);
	assign y = a & (b | c);
endmodule

module bool_gates (input wire a, b, c output wire y);
	wire bc;
	or  u_or  (bc, b, c);
 	and u_and (y, a, bc);
 endmodule

 module bool_behav (input wire a, b, c, output reg y);
 	always @* begin // "Re-run this block whenever any input changes." means the 
 	y = 1'b0;   // Default value: start by assuming the output is 0.
 	if (a && (b || c)) y = 1'b1; // If a is true and (b or c) is true, change the output to 1. Otherwise, the 0 from the line above stays.
 	end
 endmodule