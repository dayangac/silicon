module add8 (
	input wire [7:0] a,b,
	output wire [7:0] sum,
	output wire		  cout
	);
	assign {cout, sum} = a + b;  // RHS is evaluated at 9 bits because LHS is 9 bits
	// cout is one bits sum is 8 so 1 bit  8 bits   =  9 bits total

endmodule : add8

module tb_add8;
  reg  [7:0] a, b;      // inputs we control
  wire [7:0] sum;       // outputs we watch
  wire       cout;
 
  // Plug in one copy of the adder and connect its pins
  add8 dut (.a(a), .b(b), .sum(sum), .cout(cout));
 
  initial begin
    a = 8'd10;  b = 8'd20;  #1;
    $display("%3d + %3d  ->  sum = %3d, cout = %b", a, b, sum, cout);
 
    a = 8'd165; b = 8'd107; #1;
    $display("%3d + %3d  ->  sum = %3d, cout = %b", a, b, sum, cout);
 
    a = 8'd255; b = 8'd1;   #1;
    $display("%3d + %3d  ->  sum = %3d, cout = %b", a, b, sum, cout);
 
    a = 8'd255; b = 8'd255; #1;
    $display("%3d + %3d  ->  sum = %3d, cout = %b", a, b, sum, cout);
 
    $finish;
  end
endmodule
 