// "BCD digit >= 5" with codes 10-15 treated as don't-care.
// below is a bcd ge5 module which checks whether or not the number store in bcd is greater
// than or equal to fünf
module bcd_ge5(input wire [3:0] d, output reg y);
	always begin @*
		casez (d)