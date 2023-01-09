`timescale 1ns / 1ps

module winner_tb(

    );
    
    reg clk = 0;
    reg reset;
    reg [4:0] result1 = 0;
    reg [4:0] result2 = 0;
    wire [1:0] winner;
    
    winner uut(clk, reset, result1, result2, winner);
    
    
    always
    begin
        #10
        clk <= ~clk;
        result2 <= result2 + 1;
        result1 <= result2 + 1;
    end
    
    initial
    begin
        reset <= 1;
        #50
        reset <= 0;
        #50
        reset <= 1;
        #50
        reset <= 0;
        #1200000
        $finish;
    end
    
endmodule
