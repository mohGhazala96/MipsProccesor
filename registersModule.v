module registersModule(clk, read_reg_1, read_reg_2, write_reg, write_data, regWrite, read_data_1, read_data_2); input clk;
	input [4:0] read_reg_1, read_reg_2, write_reg;
	input [31:0] write_data;
	input regWrite;
	output reg [31:0] read_data_1, read_data_2;
	reg [31:0] registers[31:0];
	always @ (read_reg_1, read_reg_2) 
		begin
			read_data_1 <= (read_reg_1==0)? 32'b0 : registers[read_reg_1];
			read_data_2 <= (read_reg_2==0)? 32'b0 : registers[read_reg_2]; 
		end
	always @(posedge clk) 
		begin
			if(regWrite) 
				begin
					registers[write_reg] <= write_data; 
				end
		end 
endmodule