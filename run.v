module run();
wire RegDst,Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, IDEXRegDest,IDEXALUSrc,EXMEMzero_output,ALUzero,
    pcsrc, MEMWBMemToReg;
wire [1:0] ALUOp,writeBackOut,IDEXALUop,EXMEMWB,MEMWBWB_output;
wire [2:0] memoryInoryOut,EXMEMM_output;
wire [3:0] ALUControlout;
wire [4:0] IDEXregisterDestinationOut,IDEXregisterTargetOut,EXMEMwriteRegister_output,MUXwriteRegister,
    MEMWBwriteRegister_output;
wire [31:0] instMemoryInstructionOut,ifidInstructionOut,read_data_1,read_data_2,extendedInstruction,
    IDEXregister1Out,IDEXregister2Out,IDEXoffestOut,EXMEMALUresult_output,EXMEMwriteData_output,
    ALUresult,ALUin2, DataMemoryReadData,MEMWBreadData_output,MEMWBALUResult_output,write_data,shiftLeftOut,
    addressToInstructionMemory,iAddress,pcOut,IDEXPCOut,EXMEMPC_output;
reg clk;


initial
begin
    clk=0;
  forever
    begin
        #10 clk= ~clk;
    end
end

PC pc_mod(addressToInstructionMemory,iAddress,EXMEMPC_output,pcsrc,clk);
InstructionMemory instMemory(instMemoryInstructionOut,clk,addressToInstructionMemory);
IF_ID ifid(ifidInstructionOut,pcOut,instMemoryInstructionOut,addressToInstructionMemory,clk);
registersModule regModule(clk,ifidInstructionOut[25:21],ifidInstructionOut[20:16],MEMWBwriteRegister_output
    ,write_data,MEMWBRegWrite,read_data_1,read_data_2);
SignExtened signExtend(extendedInstruction,ifidInstructionOut[15:0]);
Control controlUnit(RegDst, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite,ifidInstructionOut[31:26]);
ID_EX idex(clk,{RegWrite,MemtoReg},{Branch,MemRead,MemWrite},{RegDst,ALUOp,ALUSrc},pcOut,read_data_1,read_data_2
    ,extendedInstruction,ifidInstructionOut[20:16],ifidInstructionOut[15:11],writeBackOut,memoryInoryOut,IDEXALUop
    ,IDEXALUSrc,IDEXPCOut,IDEXregister1Out,IDEXregister2Out,IDEXoffestOut,IDEXregisterDestinationOut,IDEXregisterTargetOut,
    IDEXRegDest);
ALUControl aluControlModule(ALUControlout,ifidInstructionOut[5:0],IDEXALUop);

assign ALUin2 = IDEXALUSrc == 0 ? IDEXregister2Out : IDEXoffestOut;
assign MUXwriteRegister = IDEXRegDest == 0 ? IDEXregisterDestinationOut : IDEXregisterTargetOut;
Shift_left2 shiftLeft(shiftLeftOut,IDEXoffestOut);

ALU aluMod(ALUresult,ALUzero,IDEXregister1Out,ALUin2,ALUControlout);
EX_MEM exmem(EXMEMWB,EXMEMM_output,EXMEMPC_output,EXMEMzero_output,EXMEMALUresult_output,EXMEMwriteData_output,
    EXMEMwriteRegister_output,writeBackOut,memoryInoryOut,(shiftLeftOut+IDEXPCOut),ALUzero,IDEXregister2Out,ALUresult,
    MUXwriteRegister,clk);

DataMemory dataMemoryMod(DataMemoryReadData,EXMEMALUresult_output,EXMEMwriteData_output,EXMEMM_output[0],
    EXMEMM_output[1],clk);

assign pcsrc = EXMEMM_output[2] & EXMEMzero_output;

MEM_WB memwb(MEMWBWB_output,MEMWBreadData_output,MEMWBALUResult_output,MEMWBwriteRegister_output,
    EXMEMWB,DataMemoryReadData,EXMEMALUresult_output,EXMEMwriteRegister_output,clk);

assign MEMWBRegWrite = MEMWBWB_output[1];
assign MEMWBMemToReg = MEMWBWB_output[0];

assign write_data = MEMWBMemToReg == 0 ? MEMWBreadData_output : EXMEMALUresult_output;

endmodule




