`timescale 1ns / 1ps

module winner(
    input clk,
    input reset,
    input [4:0] result1,
    input [4:0] result2,
    output reg [1:0] winner
    );
    
    always@(posedge clk)
    begin
        if(reset)begin
            
            winner <= 0;
            
        end else begin
        
            if ((result1 >= 20) && (result1 > result2))begin
                winner <= 1;
            end else if ((result2 >= 20) && (result2 > result1))begin
                winner <= 2;
            end else if ((result1 >= 20) && (result1 == result2) )begin
                winner <= 3;
            end
            
        end
    end 
endmodule
