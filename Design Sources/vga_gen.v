module vga_gen 
#(
   parameter RES1_LEFT = 75,
   parameter RES1_RIGHT = 95,
   parameter RES1_BOT = 720,
   parameter RES2_LEFT = 1185,
   parameter RES2_RIGHT = 1205,
   parameter RES2_BOT = 720,
   
   parameter BLOCK1_LEFT = 170,
   parameter BLOCK1_RIGHT = 470,
   parameter BLOCK2_LEFT = 810,
   parameter BLOCK2_RIGHT = 1110
)
(
    input [10:0] x,
    input [9:0] y,
    input active,
    input [1:0] winner, //result from game logic
    
    input [9:0] block1_top,   //blockcoordinates
    input [9:0] block1_bot,
    input [10:0] block1_left,
    input [10:0] block1_right,
    
    input [9:0] block2_top,    //blockcoordinates
    input [9:0] block2_bot,
    input [10:0] block2_left,
    input [10:0] block2_right,
    
    input [9:0] res1_top,       //scoring visual coordinates
    input [9:0] res1_bot,
    input [10:0] res1_left,
    input [10:0] res1_right,
    
    input [9:0] res2_top,       //scoring visual coordinates
    input [9:0] res2_bot,
    input [10:0] res2_left,
    input [10:0] res2_right,
    
    output reg [3:0] red,
    output reg [3:0] green,
    output reg [3:0] blue);
    
    
    always @*
    begin
        if (active) begin
           
           if(winner==0)begin
            //block1
                if (x >= BLOCK1_LEFT && x < BLOCK1_RIGHT && y >= block1_top && y < block1_bot) begin
                    
                        red <= 4'b1111;
                        green <= 4'b0000;
                        blue <= 4'b0000;
                    
                end else if (x >= BLOCK2_LEFT && x < BLOCK2_RIGHT && y >= block2_top && y < block2_bot)begin
                    
                        red <= 4'b0000;
                        green <= 4'b1111;
                        blue <= 4'b0000;
                    
                end else if (x >= BLOCK1_LEFT && x < BLOCK2_RIGHT && y >= 620 && y < 650)begin
                        red <= 4'b0000;
                        green <= 4'b0000;
                        blue <= 4'b1111;
                        
                end else if (x >= RES1_LEFT && x < RES1_RIGHT && y >= res1_top)begin
                        red <= 4'b1111;
                        green <= 4'b0000;
                        blue <= 4'b0000;
                        
                end else if (x >= RES2_LEFT && x < RES2_RIGHT && y >= res2_top)begin
                        red <= 4'b0000;
                        green <= 4'b1111;
                        blue <= 4'b0000;
                        
                end else begin
                        red <= 0;
                        green <= 0;
                        blue <= 0;
                end
                        
            
            end else if (winner==1)begin
                
                if (x >= 0 && x < 1280 && y >= 0 && y < 720) begin
                    
                        red <= 4'b1111;
                        green <= 4'b0000;
                        blue <= 4'b0000;
                    
                 end else begin
                        red <= 0;
                        green <= 0;
                        blue <= 0;
                 end
                 
                 
            end else if (winner==2)begin
                
                if (x >= 0 && x < 1280 && y >= 0 && y < 720) begin
                    
                        red <= 4'b0000;
                        green <= 4'b1111;
                        blue <= 4'b0000;
                 end else begin
                        red <= 0;
                        green <= 0;
                        blue <= 0;
                 end
            
            end else begin
                if (x >= 0 && x < 1280 && y >= 0 && y < 720) begin
                    
                        red <= 4'b1111;
                        green <= 4'b1111;
                        blue <= 4'b0000;
                   
                 end else begin
                        red <= 0;
                        green <= 0;
                        blue <= 0;
                 end
                 
            end
            
            
            
            
        end else begin
            red <= 0;
            green <= 0;
            blue <= 0;
        end   
    end    
endmodule