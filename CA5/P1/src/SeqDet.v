`timescale 1ns/1ns
module SeqDet(input clk, serIn, rst, output seqValid);
  parameter [2:0] A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100, F = 3'b101, G = 3'b110, H = 3'b111;
  reg [2:0] state = A, nextState = A;

  always @(serIn, state) begin
    case (state)
      A: nextState = serIn ? A : B;
      B: nextState = serIn ? C : B;
      C: nextState = serIn ? D : B;
      D: nextState = serIn ? E : B;
      E: nextState = serIn ? F : B;
      F: nextState = serIn ? G : B;
      G: nextState = serIn ? A : H;
      H: nextState = serIn ? C : B;
      default: nextState = A;
    endcase
  end

  always @(posedge clk, posedge rst) begin
    if (rst)
      state <= A;
    else
      state <= nextState;
  end

  assign seqValid = state == H;
endmodule