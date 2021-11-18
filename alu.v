module alu (
    input [1:0] ALUControl, input [31:0] A, input [31:0] B, 
    output [3:0] ALUFlags, output reg [31:0] Result
);
    wire [31:0] mux2_1;
    wire [32:0] Sum;
    wire Overflow, Carry,Negative, Zero;
    
    assign mux2_1 = (ALUControl[0]==0)? B: ~B;
    assign Sum = A+mux2_1+ALUControl[0];

    
    always @(*) begin
        casex (ALUControl)
            2'b0?: Result = Sum;
            2'b10: Result = A & B;
            2'b11: Result = A | B;
        endcase
    end

    assign Overflow = ~(ALUControl[0]^A[31]^B[31]) & (Sum[31]^A[31]) & ~ALUControl[1];
    assign Zero = 32'b0 == Result;
    assign Negative = Result[31];
    assign Carry = ~ALUControl[1] & Sum[32];

    assign ALUFlags = {Negative, Zero, Carry, Overflow};    

endmodule