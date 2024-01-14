`timescale 1ns/1ns
module SevenInputOneCounter_TB;
  reg a0, a1, a2, a3, a4, a5, a6;
  wire y0, y1, y2;
  
  SevenInputOneCounter uut(
    .a0(a0), .a1(a1), .a2(a2), .a3(a3), .a4(a4), .a5(a5), .a6(a6),
    .y0(y0), .y1(y1), .y2(y2)
    );
  
  initial begin
    {a0, a1, a2, a3, a4, a5, a6} = {0, 0, 0, 0, 0, 0, 0};
      
    repeat (128) #200 begin
      {a0, a1, a2, a3, a4, a5, a6} = {a0, a1, a2, a3, a4, a5, a6} + 1;
    end
      
    $finish;
  end
endmodule