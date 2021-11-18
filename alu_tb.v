`timescale 1ps/1ps
module alu_tb;

    reg a, b;
    wire c;

    alu test(a,b,c);

    initial begin
        a = 1;
        b = 2;
        #1;
        $display(a, b, c);
    end

endmodule