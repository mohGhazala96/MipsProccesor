module InstructionMemory(clock,instructionAdress,instructionOut);
input clock;
input [7:0] instructionAdress;
output reg [31:0] instructionOut;
reg[7:0] instructionMemory[511:0];

initial
	begin
		//Arithmetic:
		//add 
		instructionMemory[0] = 8'b00000000;  
		instructionMemory[1] = 8'b00000000;     
		instructionMemory[2] = 8'b00000000;
		instructionMemory[3] = 8'b00000000;

		//sub 
		instructionMemory[4] = 8'b00000000;  
		instructionMemory[5] = 8'b00000000;     
		instructionMemory[6] = 8'b00000000;
		instructionMemory[7] = 8'b00000000;

		// addi 
		instructionMemory[8] = 8'b00000000;  
		instructionMemory[9] = 8'b00000000;     
		instructionMemory[10] = 8'b00000000;
		instructionMemory[11] = 8'b00000000;
	//_____________________________________________________
		//Load/Store:

		//lw 
		instructionMemory[12] = 8'b00000000;
		instructionMemory[13] = 8'b00000000;
		instructionMemory[14] = 8'b00000000;
		instructionMemory[15] = 8'b00000000;

		//sw 
		instructionMemory[16] = 8'b00000000;
		instructionMemory[17] = 8'b00000000;
		instructionMemory[18] = 8'b00000000;
		instructionMemory[19] = 8'b00000000;
	//_____________________________________________________

		//Logic:
		//and 
		instructionMemory[20] = 8'b00000000;  
		instructionMemory[21] = 8'b00000000;     
		instructionMemory[22] = 8'b00000000;
		instructionMemory[23] = 8'b00000000;

		//or 
		instructionMemory[24] = 8'b00000000;  
		instructionMemory[25] = 8'b00000000;     
		instructionMemory[26] = 8'b00000000;
		instructionMemory[27] = 8'b00000000;

		//sll
		instructionMemory[28] = 8'b00000000;
		instructionMemory[29] = 8'b00000000;  
		instructionMemory[30] = 8'b00000000;
		instructionMemory[31] = 8'b00000000;


		//srl 
		instructionMemory[32] = 8'b00000000;
		instructionMemory[33] = 8'b00000000;  
		instructionMemory[34] = 8'b00000000;
		instructionMemory[35] = 8'b00000000;

		// andi 
		instructionMemory[36] = 8'b00000000;  
		instructionMemory[37] = 8'b00000000;     
		instructionMemory[38] = 8'b00000000;
		instructionMemory[39] = 8'b00000000;

		// ori 
		instructionMemory[40] = 8'b00000000;
		instructionMemory[41] = 8'b00000000;     
		instructionMemory[42] = 8'b00000000;
		instructionMemory[43] = 8'b00000000;
	//_____________________________________________________
		//Control Flow

		//beq 
		instructionMemory[44] = 8'b00000000;
		instructionMemory[45] = 8'b00000000;
		instructionMemory[46] = 8'b00000000;
		instructionMemory[47] = 8'b00000000;

		//beq 
		instructionMemory[48] = 8'b00000000;
		instructionMemory[49] = 8'b00000000;
		instructionMemory[50] = 8'b00000000;
		instructionMemory[51] = 8'b00000000;

		//bne 
		instructionMemory[52] = 8'b00000000;
		instructionMemory[53] = 8'b00000000;
		instructionMemory[54] = 8'b00000000;
		instructionMemory[55] = 8'b00000000;
	//_____________________________________________________

		// Comparison
		//slt 
		instructionMemory[56] = 8'b00000000;
		instructionMemory[57] = 8'b00000000;  
		instructionMemory[58] = 8'b00000000;
		instructionMemory[59] = 8'b00000000;

		//slt 
		instructionMemory[60] = 8'b00000000;
		instructionMemory[61] = 8'b00000000;  
		instructionMemory[62] = 8'b00000000;
		instructionMemory[63] = 8'b00000000;
	end

always@(posedge clock)
	begin
		instructionOut = {instructionMemory[instructionAdress],
						instructionMemory[instructionAdress + 1],
						instructionMemory[instructionAdress + 2], 
						instructionMemory[instructionAdress + 3]};
	end
endmodule
