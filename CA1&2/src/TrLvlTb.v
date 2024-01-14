`timescale 1ns/1ns
module TransistorLevelOneCounter_TB;
  reg a, b, c;
  wire y0, y1;
  
  TransistorLevelOneCounter uut(.a(a), .b(b), .c(c), .y0(y0), .y1(y1));
  
  initial begin
    a = 0; b = 1; c = 0;
    #200 b = 0;

    #30 a = 0; b = 1; c = 1;
    #200 c = 0;

    #30 a = 1; b = 0; c = 0;
    #200 b = 1;

    #30 a = 1; b = 1; c = 0;
    #200 a = 0;

    #200
      
    $finish;
  end
endmodule