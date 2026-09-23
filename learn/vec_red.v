module gates_vector (
  input  wire [3:0] a, b,
  output wire [3:0] y_bitwise,   // four independent AND gates
  output wire       all_ones,    // 4-input AND  (reduction)
  output wire       any_one,     // 4-input OR   (reduction)
  output wire       parity       // 4-input XOR  (reduction)
);

  assign y_bitwise = a & b;
  assign all_ones = &a; //are all bits one
  assign any_one = |a; // is just one of the bits one
  assign parity = ^a; //is the num of ones odd, 
  //XOR works like a light switch that flips every time it sees a 1., for the one above
endmodule