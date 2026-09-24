// gate level 2:1
module mux2_gates (input wire d0, d1, s, output wire y);
	wire ns,t0,t1; //wiring between gates
	not (ns,s); //flips value of s puts in ns
	and (t0, d0,ns);// d0 and ns put into t0
	and (t1,d1,s); // d1 and s put into t1
 	or (y, t0, t1); //combine t0 t1
endmodule
//equation (d0 AND NOT s) or (d1 AND s)

// dataflow 2:1
module mux2 #(parameter W = 8)(
	input wire [W-1:0] d0,d1,
	input wire			s,
	output wire 		[W-1: 0] y
	);
	assign y = s ? d1 : d0;
endmodule

