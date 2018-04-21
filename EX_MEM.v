module EX_MEM (WB_output,M_output, PC_output ,zero_output, ALUresult_output,writeData_output,writeRegister_output,WB,M,PC,zero,writeData,ALUresult,writeRegister,clk);
input [1:0] WB; 
input [2:0] M;
input [7:0] PC;
input [31:0] ALUresult,writeData;
input zero;
input [4:0] writeRegister;
input clk;

output reg [1:0] WB_output;
output reg [31:0] ALUresult_output,writeData_output;
output reg zero_output;
output reg [7:0] PC_output;
output reg [4:0] writeRegister_output;
output reg [2:0] M_output;
always @(posedge clk)
begin
WB_output <= WB;
ALUresult_output <= ALUresult;
writeData_output <= writeData;
M_output <= M;
PC_output <= PC;
zero_output <=zero;
writeRegister_output <= writeRegister;
end

endmodule

