`timescale 1ns / 1ps

module topmodule(
    input clk_100MHz,
    input reset,
    input userin1, 
    input userin2,
    output wire hsync,
    output wire vsync,
    output wire [3:0] red,
    output wire [3:0] green,
    output wire [3:0] blue 
    );
    
    wire clk_74_25MHz;
    wire clk_slow;
    wire active;
    wire [10:0] xpos;
    wire [9:0] ypos;
    
    wire [9:0] block1_top;
    wire [9:0] block1_bot;
    wire [10:0] block1_left;
    wire [10:0] block1_right;
    
    wire [9:0] block2_top;
    wire [9:0] block2_bot;
    wire [10:0] block2_left;
    wire [10:0] block2_right;
    
    wire [9:0] res1_top;
    wire [9:0] res1_bot;
    wire [10:0] res1_left;
    wire [10:0] res1_right;
    
    wire [9:0] res2_top;
    wire [9:0] res2_bot;
    wire [10:0] res2_left;
    wire [10:0] res2_right;
    
    wire [4:0] result1;
    wire [4:0] result2;
    wire [1:0] winner;
    
    
    vga_gen vg(.x(xpos),
               .y(ypos),
               .active(active),
               .winner(winner),
               
               .block1_top(block1_top),
               .block1_bot(block1_bot),
               .block1_left(block1_left),
               .block1_right(block1_right),
               
               .block2_top(block2_top),
               .block2_bot(block2_bot),
               .block2_left(block2_left),
               .block2_right(block2_right),
               
               .res1_top(res1_top),
               .res1_bot(res1_bot),
               .res1_left(res1_left),
               .res1_right(res1_right),
               
               .res2_top(res2_top),
               .res2_bot(res2_bot),
               .res2_left(res2_left),
               .res2_right(res2_right),
               
               .red(red),
               .green(green),
               .blue(blue));
               
    winner wn(.clk(clk_74_25MHz),
              .reset(reset),
              .result1(result1),
              .result2(result2),
              .winner(winner));
              
              
    linecheck lc(.clk(clk_slow),  // originally 74.25MHz
                 .reset(reset),
                 .userin1(userin1),
                 .userin2(userin2),
                 .block1_bot(block1_bot),
                 .block2_bot(block2_bot),
                 .result1(result1),
                 .result2(result2),
                 
                 .res1_top(res1_top),
                 .res1_bot(res1_bot),
                 .res1_left(res1_left),
                 .res1_right(res1_right),
                 
                 .res2_top(res2_top),
                 .res2_bot(res2_bot),
                 .res2_left(res2_left),
                 .res2_right(res2_right));
                 
    blockmaster bm(.clk_blk(clk_slow), 
                   .reset(reset),
                   .userin1(userin1),
                   .userin2(userin2),
                   .block1_top(block1_top),
                   .block1_bot(block1_bot),
                   .block1_left(block1_left),
                   .block1_right(block1_right),
               
                   .block2_top(block2_top),
                   .block2_bot(block2_bot),
                   .block2_left(block2_left),
                   .block2_right(block2_right));
    
    vga_timing vt(.clk(clk_74_25MHz),
                  .vsync(vsync),
                  .hsync(hsync),
                  .active(active),
                  .x(xpos),
                  .y(ypos));
    
    clk_wiz_0 cw(.clk_in1(clk_100MHz),
                 .clk_out1(clk_74_25MHz));
    
    clk_blk cb(.clk_in(clk_100MHz),
               .clk_slow(clk_slow));
endmodule
