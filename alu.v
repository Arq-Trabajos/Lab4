module alu (
    input [1:0] ALUControl, input [31:0] A, input [31:0] B, input [31:0] Sum,
    output [3:0] ALUFlags, output [31:0] result
);
    wire [31:0] not_B;
    assign not_B = ~B;

    wire [31:0] w0;
    mux2_1 muxALU0_B(.o(w0), .i0(B), .i1(not_B), .s(ALUControl[0]));
endmodule

module mux2_1(
    input [31:0] i0, input [31:0] i1, input s,
    output [31:0] o
);
    assign o = (s==0)?i0:i1;
endmodule

/* module mux4_1(
    input [1:0] S, input A, B, C, D,
    output O
);
    
endmodule */