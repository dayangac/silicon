module bcd_to_7seg (
	input wire[3:0] bcd,
	output reg [6:0] seg
	);
	always @* begin
		/* This means "whenever any input changes, re-run this block." 
		The @* watches all inputs automatically, so the output always matches the current input. 
		That makes it plain combinational logic, with no clock and no stored state. */
		case (bcd)
			4'd0: seg = 7'b1111110;
			4'd1: seg = 7'b0111110;
			4'd2: seg = 7'b1101101;
			4'd3: seg = 7'b1111001;
			4'd4: seg = 7'b0110011;
			4'd5: seg = 7'b1011011;
      		4'd6: seg = 7'b1011111;
      		4'd7: seg = 7'b1110000;
      		4'd8: seg = 7'b1111111;
      		4'd9: seg = 7'b1111011;
      		default: seg = 7'b0000000;
      	endcase
      end
     endmodule


// THE DISPLAY
// A seven-segment display has 7 bars. They are named with letters by a
// standard convention: start at the top, go clockwise around the
// outside (a, b, c, d, e, f), then the middle bar is last (g).
//
//        ─a─
//       │   │
//       f   b
//       │   │
//        ─g─
//       │   │
//       e   c
//       │   │
//        ─d─
//
// THE INPUT
// bcd is a 4-bit number. BCD = Binary-Coded Decimal, meaning one
// decimal digit stored in 4 bits. 4 bits can hold 0-15, but only
// 0-9 are real digits. 10-15 (hex A-F) are invalid.
//
// THE OUTPUT
// seg is 7 bits, one bit per bar, in the order {a,b,c,d,e,f,g}:
//
//     seg[6] seg[5] seg[4] seg[3] seg[2] seg[1] seg[0]
//       a      b      c      d      e      f      g
//
// "Active-high" means 1 = bar ON, 0 = bar OFF.