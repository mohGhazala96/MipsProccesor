module IF_ID(InstructionOut,PCOut,InstructionIn,PCIn,clock);
  input   [31:0] InstructionIn;
  input [31:0] PCIn;
  input clock ;
  wire pcOutIncremendted;
  output reg [31:0] InstructionOut;
  output reg [31:0] PCOut;

  assign pcOutIncremendted= PCIn+4; // address coming out from the pc added with 4
  always@(posedge clock)
      begin
        PCOut = pcOutIncremendted ;
        InstructionOut = InstructionIn ;
      end
endmodule
 
module Test_IF_ID;
  reg [31:0] PCIn;
    reg [31:0] IntructionIn;
    reg clock ;
    wire [31:0] InstructionOut;
  wire [31:0] PCOut;
    initial
      begin
        PCIn=32'b00000000000000000000000000000001;
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
   
  IF_ID IF_ID_Reg(InstructionOut, PCOut,IntructionIn,PCIn, clock);

    always@(posedge clock) begin
        PCIn  += 4;
        $display("pc is %d", PCOut);
    end

endmodule
