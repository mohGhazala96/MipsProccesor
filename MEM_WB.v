module MEM_WB (WB_output, readData_output,ALUResult_output,writeRegister_output, WB,readData,ALUResult,writeRegister,clk);

input [1:0] WB;
input [31:0] readData,ALUResult;
input [4:0] writeRegister;
input clk;

output reg [31:0] readData_output,ALUResult_output;
output reg [4:0] writeRegister_output;
output reg [1:0] WB_output;

always @ (posedge clk)
begin
    readData_output <= readData;   
    writeRegister_output <= writeRegister;
    WB_output <= WB;
    ALUResult_output <= ALUResult;
end
endmodule

module MEM_WB_test;

reg [1:0] WB;
reg [31:0] readData,ALUResult;
reg [4:0] writeRegister;
reg clk;

wire [31:0] readData_output,ALUResult_output;
wire [4:0] writeRegister_output;
wire [1:0] WB_output;

MEM_WB testing (WB_output, readData_output,ALUResult_output,writeRegister_output, WB,readData,ALUResult,writeRegister,clk);
initial begin
  WB = 2'b11;
  readData = 32'b00000000000000000000000000001111;
  ALUResult =32'b00000000000000000000000000001011;
  writeRegister = 5'b11111;
  clk =1'b1;
end
        always@(readData_output) begin
        $display("%s %d","readData_output",readData_output);
         end
        always@(ALUResult_output) begin
        $display("%s %d","ALUResult output",ALUResult_output);
         end
        always@(writeRegister_output) begin
        $display("%s %d","writeRegister output",writeRegister_output);
         end
        always@(WB_output) begin
        $display("%s %d","WB output",WB_output);
         end
endmodule