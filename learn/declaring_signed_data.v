// declaring signed data
module signed_demo:
	reg signed[7:0] a = -5;
	reg [7:0] u = 8'hFB; // h is for hex
	reg signed [15:0] w;
	reg        [15:0] uw;
	initial begin //initial means run this once, at the very start of the simulation
		w = a;
		uw = u;
		$display("a=%0d u=%0d w=%0d uw=%0d", a, u, w, uw);
    	$display("a>>>1 = %b   u>>>1 = %b", a >>> 1, u >>> 1);   // 11111101 vs 01111101
    	$display("a < 0 : %b   u < 0 : %b", a < 0, u < 0);       // 1 vs 0
  end
endmodule



