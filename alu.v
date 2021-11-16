module alu (
    input [1:0] ALUControl, input [31:0] A, input [31:0] B, input [31:0] Sum,
    output [3:0] ALUFlags, output [31:0] Result
);
    wire [31:0] not_B;
    assign not_B = ~B;

    wire [31:0] mux2_1;
    wire [31:0] adder;
    assign mux2_1 = (ALUControl[0]==0)? B: not_B;
    assign adder = A+mux2_1+ALUControl[0];

    wire [31:0] mux4_1;
    always @(*) begin
        casex (ALUControl[1:0])
            2b'0?: Result = adder;
            2b'10?: Result = A & B;
            2b'11?: Result = A | B;
        endcase
    end



endmodule