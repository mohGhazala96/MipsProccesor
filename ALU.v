module ALU(result, zero, in1, in2, shamt, op);
    input[31:0] in1;
    input[31:0] in2;
    input[4:0] shamt;
    input[3:0] op;

    output reg zero;
    output reg[31:0] result;

    always@(in1, in2, op)
        begin
        case(op)
            4'b0000: result <= in1 & in2;
            4'b0001: result <= in1 | in2;
            4'b0010: result <= in1 + in2;
            4'b0110: result <= in1 - in2;
            4'b0111: result <= in1 < in2 ? 1 : 0;
            4'b1000: result <= in1 << shamt;
            4'b1001: result <= in1 >> shamt;
            default: result <= 0;
        endcase
        end


    always@(result)
        zero = result == 0 ? 1 : 0;
endmodule

module ALUControl(out, func, op);
    input[5:0] func;
    input[1:0] op;

    output reg[3:0] out;

    always@(func, op)
        case(op)
            2'b00: out = 4'b0010;
            2'b01: out = 4'b0110;
            2'b10: case(func)
                       6'b100000: out = 4'b0010;
                       6'b100010: out = 4'b0110;
                       6'b100100: out = 4'b0000;
                       6'b100101: out = 4'b0001;
                       6'b101010: out = 4'b0111;
                       6'b000000: out = 4'b1000;
                       6'b000010: out = 4'b1001;
                       default: out = 4'bzzzz;
                   endcase
            default: out = 4'bzzzz;
        endcase
endmodule

// module TestALU;
//     reg[5:0] func;
//     reg[3:0] op;
//     reg[4:0] shamt;
//     reg[31:0] in1;
//     reg[31:0] in2;

//     wire[31:0] res;
//     wire zero;

//     ALU alucontrol(res, zero, in1, in2, shamt, op);

//     initial begin
//         op = 4'b1000;
//         func = 6'b000000;
//         in1 = 2'b11;
//         in2 = 2'b11;
//         shamt = 5'b00001;
//     end

//     always@(res) begin
//         $display("%d", res);
//     end

//     always@(zero)
//         $display("Zero: %d", zero);
// endmodule
