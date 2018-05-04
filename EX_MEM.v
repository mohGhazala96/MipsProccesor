module EX_MEM (
    WB_output,
    M_output,
    PC_output,
    zero_output,
    ALUresult_output,
    writeData_output,
    writeRegister_output,
    WB,
    M,
    PC,
    zero,
    writeData,
    ALUresult,
    writeRegister,
    clk
);
input [1:0] WB; 
input [2:0] M;
input [31:0] PC;
input [31:0] ALUresult,writeData;
input zero;
input [4:0] writeRegister;
input clk;

output reg [1:0] WB_output;
output reg [31:0] ALUresult_output,writeData_output;
output reg zero_output;
output reg [31:0] PC_output;
output reg [4:0] writeRegister_output;
output reg [2:0] M_output;

initial M_output = 3'b000;

always @(posedge clk)
begin
WB_output <= WB;
ALUresult_output <= ALUresult;
writeData_output <= writeData;
PC_output <= PC;
zero_output <=zero;
writeRegister_output <= writeRegister;

$display("%t EX/MEM: %b", $time, {WB_output,M_output,PC_output,zero_output,ALUresult_output,
        writeData_output,writeRegister_output});

end

always@(M) begin
    M_output <= M;
end

endmodule

// module EX_MEM_Test;
// reg [1:0] WB; 
// reg [2:0] M;
// reg [31:0]PC;
// reg [31:0]ALUresult,writeData;
// reg zero;
// reg [4:0]writeRegister;
// reg clk;

// wire [1:0] WB_output;
// wire [31:0]ALUresult_output,writeData_output;
// wire zero_output;
// wire [31:0] PC_output;
// wire [4:0] writeRegister_output;
// wire [2:0] M_output;

// EX_MEM testing (WB_output,M_output, PC_output ,zero_output, ALUresult_output,writeData_output,writeRegister_output,WB,M,PC,zero,writeData,ALUresult,writeRegister,clk);
// initial begin
//   WB = 2'b01;
//   M =3'b001;
//   PC=32'b00000000000000000000000000000000;
//   ALUresult = 32'b00000000000000000000000000000011;
//   writeData = 32'b00000000000000000000000000011111;
//   zero = 1'b0;
//   writeRegister= 5'b11111;
//   clk= 1'b1;
// end
//     always@(WB_output) begin
//         $display("%s %d","WB output", WB_output);
//     end
//         always@(ALUresult_output) begin
//         $display("%s %d","ALUresult output", ALUresult_output);
//          end

//         always@(writeData_output) begin
//         $display("%s %d","writeData output",writeData_output);
//          end


//             always@(zero_output) begin
//         $display("%s %d","zero output",zero_output);
//          end
//         always@(PC_output) begin
//         $display("%s %d","PC output",PC_output);
//          end
//                  always@(writeRegister_output) begin
//         $display("%s %d","writeRegister output",writeRegister_output);
//          end
//         always@(M_output) begin
//         $display("%s %b","M output",M_output);
//          end
         
    


// endmodule