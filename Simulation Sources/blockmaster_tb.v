`timescale 1ns / 1ps

module blockmaster_tb(
    
    );
    
    reg clk = 0;
    reg reset;
    reg userin1 = 0;
    reg userin2 = 0;
    
    wire [9:0] block1_top;
    wire [9:0] block1_bot;
    wire [10:0] block1_left;
    wire [10:0] block1_right;
    
    wire [9:0] block2_top;
    wire [9:0] block2_bot;
    wire [10:0] block2_left;
    wire [10:0] block2_right;
    
    blockmaster uut(clk, reset, userin1, userin2, block1_top, block1_bot, block1_left, block1_right, block2_top, block2_bot, block2_left, block2_right);
    
    always
    begin
        #10
        clk <= ~clk;
    end
    
    always
    begin
        #10
        userin1 <= ~userin1;
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
