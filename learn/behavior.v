module gates_behavioral (input wire a,b output reg y_and, y_xor);
	always @*  begin
		y_and = a & b
		y_xor = (a != b)
	end
			
endmodule : gates_behavioral