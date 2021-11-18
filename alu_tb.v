`timescale 1ns/1ns
`include "alu.v"

module alu_tb;
  	reg [1:0] alucontrol;
  	reg [31:0] a;
  	reg [31:0] b;
  	wire [3:0] aluflags; 
  	wire [31:0] result;

  alu test(.ALUControl(alucontrol), .A(a), .B(b), .ALUFlags(aluflags), .Result(result));
    initial begin
        alucontrol = 2'b10;
      	a = 32'h12345678;
        b = 32'h87654321;
        #1;
        $display("%b %x %x %x %d",alucontrol,a,b , result,aluflags);
    end
    initial begin
        $dumpfile("alu.vcd");
        $dumpvars;
    end

endmodule