module ID_EX(clock,writeBackIn,memoryIn,EX,pcIN,register1In,register2In,offestIn,
    registerTargetIn,registerDestinationIn
    , writeBackOut,memoryInoryOut, ALUop,ALUSrc,
    pcOut,register1Out,register2Out,offestOut,
    registerDestinationOut,registerTargetOut,RegDst);

// EX is used as  ALUSrc,RegDst and ALUop
input clock ;
input [31:0] register1In,register2In,offestIn;
input [7:0] pcIN;
input [4:0] registerTargetIn,registerDestinationIn;
input [1:0] writeBackIn;
input [2:0]memoryIn;
input [3:0] EX;

output reg [31:0] register1Out,register2Out,offestOut;
output reg [7:0] pcOut;
output reg [4:0] registerDestinationOut,registerTargetOut;
//writeBackOut 2 bits as it has two wires out ,,alu is 2 bits followed amjad's paregisterTargetIn
output reg [1:0] writeBackOut,ALUop;
output reg [2:0] memoryInoryOut;
output reg ALUSrc, RegDst;


always@(posedge clock)
    begin
        writeBackOut<= writeBackIn;
        memoryInoryOut<= memoryIn;
        ALUSrc<= EX[0];
        ALUop<= {EX[2],EX[1]};
        RegDst<= EX[3];
        pcOut <= pcIN;
        register1Out <= register1In;
        register2Out <= register2In;
        offestOut <= offestIn;
        registerTargetOut<= registerTargetIn;
        registerDestinationOut<= registerDestinationIn;
    end

endmodule
 
