`timescale 1ns / 1ps

module blockmaster(
    input clk_blk,
    input reset,
    input userin1,
    input userin2,
    
    output reg [9:0] block1_top,
    output reg [9:0] block1_bot,
    output reg [10:0] block1_left, //width of 300px
    output reg [10:0] block1_right,
    
    output reg [9:0] block2_top,
    output reg [9:0] block2_bot,
    output reg [10:0] block2_left, //width of 300px
    output reg [10:0] block2_right
    );
    reg u1;
    reg u2;
    wire p1;
    wire p2;
    
    assign p1 = userin1 && ~u1;
    assign p2 = userin2 && ~u2;
    
    always@(posedge clk_blk)
    begin
        u1 <= userin1;
        u2 <= userin2;
        
        if (reset||(p1&&((block1_bot>=600)&&(block1_bot<650)))) begin
            block1_bot <= 100;
            block1_top <= 50;
        end else begin
            if(block1_bot != 720)begin
                block1_bot <= block1_bot + 5;
                block1_top <= block1_top + 5;
            end else begin
                block1_bot <= 100;
                block1_top <= 50;
            end
        end
        
        
        
        if (reset||(p2&&((block2_bot>=600)&&(block2_bot<650)))) begin   
            block2_bot <= 100;
            block2_top <= 50;
        end else begin
            if(block2_bot != 720)begin
                block2_bot <= block2_bot + 5;
                block2_top <= block2_top + 5;
            end else begin
                block2_bot <= 100;
                block2_top <= 50;
            end
        end
        
    end

    
endmodule
