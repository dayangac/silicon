module fa_gates (input wires a,b, cin, output wire s, cout);
	wire p, g, t;
	xor (p, a, b);
	xor (s, p, cin)
	and (g, a, b);
  	and (t, p, cin);
  	or  (cout, g, t);
endmodule
