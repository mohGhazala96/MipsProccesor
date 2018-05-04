module PC(addressToInstructionMemory,incrementAddress,branchAddress,PCSrc,clock);
    input clock;
    input PCSrc;
    input [31:0] branchAddress ;
    input [31:0] incrementAddress ;
    output reg  [31:0] addressToInstructionMemory;
    always @(posedge clock)
        begin
            $display("incrementAddress: %b", incrementAddress);
            $display("PCSrc: %b", PCSrc);
            addressToInstructionMemory = (PCSrc == 1) ? branchAddress: incrementAddress;
            $display("addressToInstructionMemory: %b", addressToInstructionMemory);
        end
endmodule
