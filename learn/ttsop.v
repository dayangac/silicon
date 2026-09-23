// same as sop tho written as a truth table

module kmap_synth (input wire a,b,c,d output reg y
	always @*
		case ({a, b, c, d})
			4'd0, 4'd2, 4'd5, 4'd7, 4'd8, 4'd10, 4'd13, 4'd15: y = 1'b1;
     		default:                                          y = 1'b0;
     	endcase
    end
endmodule