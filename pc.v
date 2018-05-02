module PC(addressToInstructionMemory,incrementAddress,branchAddress,PCSrc,clock);
    input clock;
    input PCSrc;
    input [31:0] branchAddress ;
    input [31:0] incrementAddress ;
    output reg  [31:0] addressToInstructionMemory;
    always @(posedge clock)
        begin
            addressToInstructionMemory <= (PCSrc==1)? branchAddress: incrementAddress;
        end
endmodule
