module Shift_left2(out , in);
 input [5:0] in;
 output reg [7:0] out;

 always @ (in)

  out = in << 2;

endmodule

module Shift_test;

    reg [5:0] in;
    wire [7:0] out;
    Shift_left2 test (out,in);

    initial begin
      in =6'b111111;
    end

    always @(out)
    begin
       $display("%d", out);
    end

endmodule
 
