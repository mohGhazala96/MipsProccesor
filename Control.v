module Control(RegDst, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, Instruction);
    output reg RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
    output reg[1:0] ALUOp;
    input[5:0] Instruction;

    always@(Instruction)
        begin
            $display("Instruction: %b", Instruction);
            RegDst = 0;
            Branch = 0;
            MemRead = 0;
            MemtoReg = 0;
            ALUOp = 0;
            MemWrite = 0;
            ALUSrc = 0;
            RegWrite = 0;

            case(Instruction)
                6'h00: begin RegDst = 1; ALUOp = 2; RegWrite = 1; end // add, sub, and, or, sll, srl, slt, and sltu
                6'h04: begin Branch = 1; ALUOp = 1; end // beq
                6'h08: begin ALUSrc = 1; RegWrite = 1; end // addi
                6'h23: begin MemRead = 1; MemtoReg = 1; ALUSrc = 1; RegWrite = 1; end // lw
                6'h2B: begin MemWrite = 1; ALUSrc = 1; end // sw
                6'h21: begin MemRead = 1; MemtoReg = 1; ALUSrc = 1; RegWrite = 1; end // lh
                6'h25: begin MemRead = 1; MemtoReg = 1; ALUSrc = 1; RegWrite = 1; end // lhu
            endcase
        end
endmodule
