module registersModule(clk, read_reg_1, read_reg_2, write_reg, write_data, regWrite, read_data_1, read_data_2); input clk;
	input [4:0] read_reg_1, read_reg_2, write_reg;
	input [31:0] write_data;
	input regWrite;
	output reg [31:0] read_data_1, read_data_2;
	reg [31:0] registers[31:0];
	integer i;
	integer j;

	initial begin
		for(i=0;i<32;i++)begin
			registers[i] = 0;
		end
	end
	always @ (read_reg_1, read_reg_2,registers[read_reg_1],registers[read_reg_2]) 
		begin
			read_data_1 <= (read_reg_1==0)? 32'b0 : registers[read_reg_1];
			read_data_2 <= (read_reg_2==0)? 32'b0 : registers[read_reg_2]; 
		end
	always @(posedge clk) 
		begin
			// $display("read_reg_1: %b", read_reg_1);
			// $display("read_reg_2: %b", read_reg_2);
			// $display("read_data_2: %b", read_data_2);
			$display("-------------Registers:---------");
			for (j=0;j<32;j++)begin
			$display("%t Register[%0d] : %b",$time, j,registers[j]);
			end
			// $display("regWrite: %b", regWrite);
			// $display("write_reg: ", write_reg);

			// $display("------Write data %b", write_data);
			if(regWrite) 
				begin
					registers[write_reg] = write_data; 
					// $display("Register content after write: %b", registers[write_reg]);
				end
		end 
endmodule