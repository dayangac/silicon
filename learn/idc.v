// "BCD digit >= 5" with codes 10-15 treated as don't-care.
// below is a bcd ge5 module which checks whether or not the number store in bcd is greater
// than or equal to fünf
module bcd_ge5(input wire [3:0] d, output reg y);
	always begin @*
		casez (d)
		4'b0000, 4'b0001, 4'b0010, 4'b0011, 4'b0100: y = 1'b0;
		4'b0101, 4'b0110, 4'b0111, 4'b1000, 4'b100:  y = 1'b1;
		default:  									 y = 1'bx;
		endcase
	end 
endmodule : bcd_ge5

module bcd_ge5_min (input wire [3:0] d, output wire y);
  assign y = d[3] | (d[2] & d[1]) | (d[2] & d[0]);
endmodule

/* 
d[3] = 0
d[2] & d[1] = 1 & 0 = 0
d[0] & d[1] = 1 & 0 = 0  
*/