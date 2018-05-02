module IF_ID(InstructionOut,PCOut,InstructionIn,PCIn,clock);
  input   [31:0] InstructionIn;
  input [7:0] PCIn;
  input clock ;
  wire pcOutIncremendted;
  output reg [31:0] InstructionOut;
  output reg [7:0] PCOut;

  assign pcOutIncremendted= PCIn+4; // address coming out from the pc added with 4
  always@(posedge clock)
      begin
        PCOut = pcOutIncremendted ;
        InstructionOut = InstructionIn ;
      end
endmodule
 
module Test_IF_ID;
    reg [7:0] PCIn;
    reg clock ;
    wire [31:0] InstructionOut;
    wire [7:0] PCOut;
    initial
      begin
        PCIn=7'b100000;
        clock = 0;

        forever
          begin
            #10 clock = ~clock;
          end
      end
    initial
    begin
        #200 $finish;
    end
   
    IF_ID IF_ID_Reg(InstructionOut, PCOut, PCIn, clock);

    always@(posedge clock) begin
        PCIn  += 4;
        $display("pc is %d", PCOut);
        $display("ins is %d", InstructionOut);
    end

endmodule
