`timescale 1ns / 1ps

module clk_blk(
    input clk_in,
    output reg clk_slow
    );
    
    reg [19:0]count;
    always@(posedge clk_in)
    begin
        count <= count+1;
        if (count == 1_000_000)begin
        count <= 0;
        clk_slow <= ~clk_slow;
        end
    end
    
endmodule
