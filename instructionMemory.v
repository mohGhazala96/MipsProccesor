module InstructionMemory(instructionOut,instructionAddress);
// input clock;
input [31:0] instructionAddress;
output reg [31:0] instructionOut;
reg[7:0] instructionMemory[511:0];

initial
	begin
		//add $t0, $t0, $0
		instructionMemory[0] = 8'b000000_01;
		instructionMemory[1] = 8'b000_00000;
		instructionMemory[2] = 8'b01000_000;
		instructionMemory[3] = 8'b00_100000;

		//add $t0, $t0, $0
		instructionMemory[4] = 8'b000000_01;
		instructionMemory[5] = 8'b000_00000;
		instructionMemory[6] = 8'b01000_000;
		instructionMemory[7] = 8'b00_100000;

		//sub $t0, $t0, $0
		instructionMemory[8] = 8'b000000_01;
		instructionMemory[9] = 8'b000_00000;
		instructionMemory[10] = 8'b01000_000;
		instructionMemory[11] = 8'b00_100010;

		//addi $t0,$t0,8
		instructionMemory[12] = 8'b001000_01;
		instructionMemory[13] = 8'b000_01000;
		instructionMemory[14] = 8'b00000000;
		instructionMemory[15] = 8'b00001000;

		//lw $t0, 0($0)
		instructionMemory[16] = 8'b100011_00;
		instructionMemory[17] = 8'b000_01000;
		instructionMemory[18] = 8'b00000000;
		instructionMemory[19] = 8'b00000000;

		//sw $t0, 0($0)
		instructionMemory[20] = 8'b101011_00;
		instructionMemory[21] = 8'b000_01000;
		instructionMemory[22] = 8'b00000000;
		instructionMemory[23] = 8'b00000000;

		//lh $t0, 0($0)
		instructionMemory[24] = 8'b100001_00;
		instructionMemory[25] = 8'b000_01000;
		instructionMemory[26] = 8'b00000000;
		instructionMemory[27] = 8'b00000000;

		//lhu $t0, 0($0)
		instructionMemory[28] = 8'b100101_00;
		instructionMemory[29] = 8'b000_01000;
		instructionMemory[30] = 8'b00000000;
		instructionMemory[31] = 8'b00000000;

		//and $t0, $t0, 0
		instructionMemory[32] = 8'b000000_01;
		instructionMemory[33] = 8'b000_00000;
		instructionMemory[34] = 8'b01000_000;
		instructionMemory[35] = 8'b00_100100;

		//or $t0, $t0, 0
		instructionMemory[36] = 8'b000000_01;
		instructionMemory[37] = 8'b000_00000;
		instructionMemory[38] = 8'b01000_000;
		instructionMemory[39] = 8'b00_100111;

		//sll $t0, $t0, 0
		instructionMemory[40] = 8'b000000_00;
		instructionMemory[41] = 8'b000_01000;
		instructionMemory[42] = 8'b01000_000;
		instructionMemory[43] = 8'b10_000000;

		//srl $t0, $t0, 0
		instructionMemory[44] = 8'b000000_00;
		instructionMemory[45] = 8'b000_01000;
		instructionMemory[46] = 8'b01000_000;
		instructionMemory[47] = 8'b10_000010;

		//slt $t0, $t0, 0
		instructionMemory[48] = 8'b000000_01;
		instructionMemory[49] = 8'b000_00000;
		instructionMemory[50] = 8'b01000_000;
		instructionMemory[51] = 8'b00_101010;

		//sltu $t0, $t0, 0
		instructionMemory[52] = 8'b000000_01;
		instructionMemory[53] = 8'b000_00000;
		instructionMemory[54] = 8'b01000_000;
		instructionMemory[55] = 8'b00_101011;

		//beq $t0, $t0, 0
		instructionMemory[440] = 8'b000100_01;
		instructionMemory[450] = 8'b000_01000;
		instructionMemory[460] = 8'b00000_000;
		instructionMemory[470] = 8'b00_000000;
	end

always@(instructionAddress)
	begin
		// $display("instructionAddress: %b", instructionAddress);
		instructionOut = {instructionMemory[instructionAddress],
						instructionMemory[instructionAddress + 1],
						instructionMemory[instructionAddress + 2],
						instructionMemory[instructionAddress + 3]};
	end
endmodule

// module InstructionMemory_tb;
// reg [31:0] instructionAddressIn;
// wire [31:0] instruction;

// InstructionMemory instMemory(instruction, instructionAddressIn);


// initial
// 	begin
// 		#5 instructionAddressIn <= 32'b00000000_00000000_00000000_00000000;
// 		#10 instructionAddressIn <= 32'b00000000_00000000_00000000_00000100;

// 		# 100000 $finish;
// 	end

// 	always@(instructionAddressIn) begin
// 		$display("%t PC In is %b", $time, instructionAddressIn);
// 	end
// 	always@(instruction) begin
// 		$display("%t Instruction Out is %b", $time, instruction);
// 	end

// endmodule
