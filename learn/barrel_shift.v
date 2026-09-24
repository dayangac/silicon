// =====================================================================
// barrel_shl: shifts d LEFT by amt places, using one mux layer per bit
// of amt. Any shift from 0 to N-1 happens in one step.
//
// Example (N = 8): d = 1011_0001, amt = 5 (101)
//   layer 0: amt[0]=1 -> shift by 1 -> 0110_0010
//   layer 1: amt[1]=0 -> pass       -> 0110_0010
//   layer 2: amt[2]=1 -> shift by 4 -> 0010_0000   = y
// =====================================================================

// The # before the first ( means "here come the PARAMETERS"
// (adjustable settings). The second ( ... ) holds the PORTS.
module barrel_shl #(
  parameter N = 8,            // data width in bits
  parameter S = $clog2(N)     // bits needed for the shift amount
                              // $clog2 = log base 2, rounded up
                              // N = 8 -> S = 3 (because 2*2*2 = 8)
)(
  input  wire [N-1:0] d,      // the data to shift        (8 bits)
  input  wire [S-1:0] amt,    // how far to shift, 0..N-1 (3 bits)
  output wire [N-1:0] y       // the shifted result       (8 bits)
);

  // -------------------------------------------------------------------
  // stage: just a NAME the author chose, not a keyword.
  // On its own this line only CREATES S+1 empty wires, each N bits wide.
  // It connects nothing and builds no logic.
  // With N = 8, S = 3:   wire [7:0] stage [0:3];
  //   stage[0]  8 bits   the input, before any shifting
  //   stage[1]  8 bits   after layer 0 (maybe shifted by 1)
  //   stage[2]  8 bits   after layer 1 (maybe shifted by 2)
  //   stage[3]  8 bits   after layer 2 (maybe shifted by 4) = answer
  // They are the connecting wires BETWEEN the layers.
  // -------------------------------------------------------------------
  wire [N-1:0] stage [0:S];

  // The first checkpoint is just the input.
  assign stage[0] = d;

  // -------------------------------------------------------------------
  // genvar k: a loop counter that only exists while the tool BUILDS the
  // circuit. It never becomes a wire or any hardware.
  // -------------------------------------------------------------------
  genvar k;

  // -------------------------------------------------------------------
  // generate: instructions for BUILDING hardware, not code that runs.
  // The for loop stamps out the assign line once per k (k = 0..S-1).
  // "begin : g_stage" starts the repeated block and NAMES the copies
  // g_stage[0], g_stage[1], g_stage[2] (useful in the simulator).
  // -------------------------------------------------------------------
  generate
    for (k = 0; k < S; k = k + 1) begin : g_stage

      // assign stage[k+1]  -> the wire this layer drives (its output)
      //                       layer k reads stage[k], writes stage[k+1]
      //
      // amt[k] ?           -> "is bit k of the shift amount on?"
      //                       this ONE bit decides what the layer does
      //
      // (stage[k] << (1 << k))  -> option if amt[k] = 1: SHIFT
      //     inner  1 << k   = how far this layer shifts: 1, 2, 4 ...
      //     outer  <<       = actually shifts the data by that much
      //
      // : stage[k]         -> option if amt[k] = 0: PASS THROUGH
      //
      // The ? : becomes a MUX (picks one of two values). The wire
      // declaration above made no logic; THIS line makes the mux.
      //
      // Why shift by 1 << k?  amt is binary, and bit k is worth 2^k:
      //     amt[2] amt[1] amt[0]
      //       4      2      1
      // So the layers that switch on add up to exactly amt.
      //   amt = 001 -> only layer 0 shifts (1). Layer 2 passes.
      //   amt = 110 -> layer 1 (2) + layer 2 (4) = 6
      // 3 layers can make any shift 0..7, like 3 bits count 0..7.
      assign stage[k+1] = amt[k] ? (stage[k] << (1 << k)) : stage[k];

    end
  endgenerate

  // With S = 3 the loop above is exactly the same as writing:
  //   assign stage[1] = amt[0] ? (stage[0] << 1) : stage[0];
  //   assign stage[2] = amt[1] ? (stage[1] << 2) : stage[1];
  //   assign stage[3] = amt[2] ? (stage[2] << 4) : stage[2];

  // The output is the last checkpoint.
  assign y = stage[S];

endmodule : barrel_shl

// this guy just cares aboout result
module barrel_shl_behav #(parameter N = 8, parameter S = $clog2(N)) (
  input  wire [N-1:0] d,
  input  wire [S-1:0] amt,
  output wire [N-1:0] y
);

	assign y = d << amt;
endmodule