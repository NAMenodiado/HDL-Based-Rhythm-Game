`timescale 1ns / 1ps

module linecheck_tb(

    );
    
    reg clk = 0;
    reg reset;
    reg userin1 = 0;
    reg userin2 = 0;    
    reg [9:0] block1_bot = 150;
    reg [9:0] block2_bot = 150;
    wire [4:0] result1;
    wire [4:0] result2;
    
    
    linecheck uut2(clk, reset, userin1, userin2, block1_bot, block2_bot, result1, result2);
    
    always
    begin
        #10
        clk <= ~clk;
        userin1 <= ~userin1;
        userin2 <= ~userin2;
        block1_bot <= block1_bot + 5;
        block2_bot <= block2_bot + 5;
    end
    
    initial
    begin
        #10
        reset <= 1;
        #40
        reset <= 0;
        #1200000
        $finish;
    end
    
endmodule
