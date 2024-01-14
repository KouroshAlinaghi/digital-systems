`timescale 1ns/1ns
module GetInputNumberTB;
  reg clk = 0;
  reg iz_cnt = 0;
  reg shen = 1;
  reg cen = 1;
  reg rst = 0;
  reg serin = 1;
  wire COPre, COPost, diff;
  wire [7:0] POPre;
  wire [7:0] POPost;

  GetInputNumber UUT1(iz_cnt, cen, shen, clk, rst, serin, COPre, POPre);
  GetInputNumberPost UUT2(iz_cnt, cen, shen, clk, rst, serin, COPost, POPost);

  assign diff = COPre ^ COPost;

  initial begin
    repeat (40) #(200) clk = ~clk;
  end

  initial begin
    #(200 * 40)

    $stop;
  end
endmodule