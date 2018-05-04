module DataMemory (readData, address, writeData, memWrite, memRead, clk);

input [31:0] writeData;
input memRead,memWrite;
input [31:0] address;
input clk;
reg [7:0] memoryCell [1000:0];

output reg [31:0] readData;
integer j;

// always @(*)
// begin
// 	$display("test------------");
// 	$display("memRead: %b", memRead);
//   $display("memWrite: %b", memWrite);
// 	$display("address: %b", address);
// end

always @ (posedge clk)
begin
  if (memRead)
      begin
         readData = {memoryCell[address],memoryCell[address+1],memoryCell[address+2],memoryCell[address+3]};
      end
  if (memWrite)
 begin
       memoryCell[address] = writeData [31:24];
       memoryCell[address+1] = writeData[23:16];
       memoryCell [address+2] = writeData[15:8];
       memoryCell [address+3] = writeData [7:0];



  // $display("-----DM Address, add: %b", address);
  // $display("-----DM Memory, mem: %b", memoryCell[address]);
  // $display("-----DM Memory, mem: %b", memoryCell[address+1]);
  // $display("-----DM Memory, mem: %b", memoryCell[address+2]);
  // $display("-----DM Memory, mem: %b", memoryCell[address+3]);
  // $display("-----DM 0 position: %b", {memoryCell[3], memoryCell[2], memoryCell[1], memoryCell[0]});
  // $display("-----DM Write Data, mem: %b", writeData);
  end
    $display("\t-------------Memory First 128 words (32):---------");
    for (j=0;j<32;j = j + 1) begin
    $display("%t Memory[%0d] : %b",$time, j*4,{memoryCell[j*4], memoryCell[j*4+1], memoryCell[j*4+2], memoryCell[j*4+3]});
    end
    $display("\t------------End Memory----------------------------");
end
endmodule



// module dataMemoryTest;

// reg [31:0] writeData;
// reg memRead,memWrite;
// reg [31:0] address;
// reg clk;

// wire [31:0] readData;

// DataMemory testing (readData,address,writeData,memWrite,memRead,clk);


//  initial begin clk = 0;

// forever
// 	begin
// 		#5 clk = ~clk;

// 	end
// end

//  initial
//  begin
//  fork
//  		#4 writeData <= 32'b00000111011111111101111111110000;
//  		# 5 memWrite <= 1'b1;
//  		# 5 memRead <=1'b0;
//  		#5 address <= 32'b00000000000000000000000000000000;
//  		#15 memWrite <=1'b0 ;
//  		#15 memRead<=1'b1;
//  	    #25 $finish;

// join
//  end

// always@(readData) begin
// 	$monitor("%t Read Data %b", $time,readData);
// end


// endmodule



