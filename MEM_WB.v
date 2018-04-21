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