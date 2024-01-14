`timescale 1ns/1ns
module DownCounterTB;
  reg clk = 0;
  reg rst = 0;
  reg dcen = 0;
  reg ld = 1;
  reg [7:0] pi = 10;
  wire COPre, COPost, diff;
  
  DownCounter UUT1(clk, rst, dcen, ld, pi, COPre);
  DownCounterPost UUT2(clk, rst, dcen, ld, pi, COPost);

  assign diff = COPre ^ COPost;

  initial begin
    repeat (40) #(200) clk = ~clk;
  end

  initial begin
    #300 ld = 0;
    dcen = 1;
    #(200 * 40)

    $stop;
  end
endmodule