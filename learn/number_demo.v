module number_demo;
	reg [7:0] a, b;   // 8-bit operands: data values exactly 8 bits (one byte) long
	reg [8:0] sum9;
	reg [7:0] sum8;
	reg [15:0] w;
	initial begin
		a = 8'hA5;
		b = 8'b0110_1011;
		sum9 = a + b;   // 9'h110 = 272
		sum8 = a + b;   // 8'h10  = 16  (truncated)
		w = {a, b};     // concatenation: 16'hA56B
		$display("a=%0d (0x%h, %b)", a, a, a); // %d prints decimal, %h prints hex, %b prints binary
		$display("a+b 9-bit = %0d (0x%h)", sum9, sum9);
		$display("a+b 8-bit = %0d (0x%h)  carry lost", sum8, sum8);
		$display("a<<2 = %0d, a>>3 = %0d", {8'b0, a} << 2, a >> 3);
		$display("{a,b} = 0x%h", w);
		$display("a[7] (MSB)=%b a[0] (LSB)=%b a[3:0]=%h", a[7], a[0], a[3:0]);
	end
endmodule