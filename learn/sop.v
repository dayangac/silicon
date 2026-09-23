module kmap (input wire a,b,c,d, output wire y);
	assign y = (~b & ~d) | (b & d)  // = ~(b ^ d); a and c are irrelevant
endmodule

// btw a and c being irrelevant isn't decided out of my ass but thorugh the kmap drawn
/*
               bd
            00   01   11   10
ac = 00      1    0    1    0
ac = 01      1    0    1    0
ac = 11      1    0    1    0
ac = 10      1    0    1    0

the sample karnaugh map
*/