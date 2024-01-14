`timescale 1ns/1ns
module SeqDetTB;
  reg clk = 0;
  reg serIn;
  reg rst = 0;
  wire seqValidPre, seqValidPost, diff;

  SeqDet UUT1(clk, serIn, rst, seqValidPre);
  SeqDetPost UUT2(clk, serIn, rst, seqValidPost);

  assign diff = seqValidPost ^ seqValidPre;

  initial begin
    repeat (20) #(200) clk = ~clk;
  end

  initial begin
    serIn = 0;
    #(200 * 1.5) serIn = 1;
    #(10 * 200 + 200 * 0.5) serIn = 0;
    #(200 * 2);

    $stop;
  end
endmodule