module SignExtened(OffsetExtended,Offset);
    input [15:0] Offset;
    output [31:0]OffsetExtended;
    assign OffsetExtended = (Offset[15]==1)? {16'hffff,Offset}: {16'h0000,Offset};
endmodule