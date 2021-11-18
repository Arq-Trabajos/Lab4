`timescale 1ns/1ns
`include "alu.v"

module alu_tb;
  // regs are for the variables that will be initialized within the alu module such as the enabler and both inputs
  reg [1:0] alucontrol;// alu control is in charge of enabling the operattions to occur by decoding them in chains of 2 bits, either SUM, AND or OR
  reg [31:0] a; // input 1 in hexadecimal
  reg [31:0] b; // input 2 in hexadecimal
  wire [3:0] aluflags; //wires are added from within the test bench to obtain results
  wire [31:0] result; // obtains the arithmetic result of the testbench

  alu test(.ALUControl(alucontrol), .A(a), .B(b), .ALUFlags(aluflags), .Result(result)); // conjunction between module and testbench, delegating vars
    initial begin
        alucontrol = 2'b10; // enable the aku
     	  a = 32'h12345678; // inputs a 32 bit hexadecimal expression to cope with the other input, b
        b = 32'h87654321; // second hexadecimal expression for the arithmetic resolution
        #1;
      	$display("%b %x %x %x %d",alucontrol,a,b , result,aluflags); //visual display for the vcd file in order to see results and other variables shit
    end
    initial begin
      $dumpfile("alu.vcd"); // Generation of waveforms file
        $dumpvars;
    end

endmodule