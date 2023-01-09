`timescale 1ns / 1ps


module linecheck(
    input clk,
    input reset,
    input userin1,
    input userin2,
    input [9:0] block1_bot,
    input [9:0] block2_bot,
    output reg [4:0] result1,
    output reg [4:0] result2,
    
    output reg [9:0] res1_top,
    output reg [9:0] res1_bot,
    output reg [10:0] res1_left,  //20px width scoring
    output reg [10:0] res1_right,
    
    output reg [9:0] res2_top,
    output reg [9:0] res2_bot,
    output reg [10:0] res2_left, //20px width scoring visual
    output reg [10:0] res2_right
    
    );
    reg u1;
    reg u2;
    wire p1;
    wire p2;
    
    assign p1 = userin1 && ~u1;
    assign p2 = userin2 && ~u2;
    
    always@(posedge clk)
    begin
        u1 <= userin1;
        u2 <= userin2;
        
        if (reset)begin
            result1 <= 0;
            result2 <= 0;
            res1_top <= 720;
            res2_top <= 720;
        end else begin
            
            if(p1 && ((block1_bot<650)&&  (block1_bot>=600)     )  ) begin
                result1 <= result1 +1;
                res1_top <= 720-(36*result1);
            end
            
            if(p2 && ((block2_bot<650)&&  (block2_bot>=600)  ) ) begin
                result2 <= result2 +1;
                res2_top <= 720-(36*result2);
            end
            
        end
    end
endmodule
