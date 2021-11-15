module alu_tb;

    reg a, b;
    wire c;

    ej test(a,b,c);

    initial begin
        a = 1;
        b = 2;
        #1;
        $display(a, b, c);
    end

endmodule