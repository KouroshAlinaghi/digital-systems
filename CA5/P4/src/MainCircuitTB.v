`timescale 1ns/1ns
module MainCircuitTB;
  reg clk = 0;
  reg rst = 0;
  reg serIn = 0;
  wire serOutPre, serOutPost, outputValidPre, outputValidPost, diff;

  MainCircuit UUT1(serIn, clk, rst, serOutPre, outputValidPre);
  MainCircuitPost UUT2(serIn, clk, rst, serOutPost, outputValidPost);

  assign diff = serOutPre ^ serOutPost;

  initial begin
    repeat (1000) #(300) clk = ~clk;
  end

  initial begin
    serIn = 0;
    #(300 * 1.5) serIn = 1;
    #(10 * 300 + 300 * 0.5) serIn = 0;
    #(300 * 2);
    repeat (1000) #320 serIn = $random();

    $stop;
  end
endmodule