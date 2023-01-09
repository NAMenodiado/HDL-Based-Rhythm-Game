module vga_timing(
    input clk,
    output reg hsync,
    output reg vsync,
    output reg active,
    output wire [10:0] x, // 0 to 1279 (max of 2047)
    output wire [9:0] y   // 0 to 719  (max of 1023)
);
    parameter total_width = 1650;
    parameter total_height = 750;

    parameter h_active = 1280;
    parameter h_front_porch = 110;
    parameter h_back_porch = 220;
    parameter h_sync_pulse = 40;
    
    parameter v_active = 720;
    parameter v_front_porch = 5;
    parameter v_back_porch = 20;
    parameter v_sync_pulse = 5;

    reg [10:0] hpos; // 0 to 1649
    reg [9:0] vpos;  // 0 to 749
    
    reg next_line; 
    
    always @(posedge clk)
    begin
        if (hpos >= total_width-1) begin
            hpos <= 0;
            next_line <= 1;
        end else begin
            hpos <= hpos + 1;
            next_line <= 0;
        end
    end
    
    always @(posedge clk)
    begin
        if (next_line) begin
            if (vpos >= total_height-1) begin
                vpos <= 0;
            end else begin
                vpos <= vpos + 1;
            end
        end else begin
            vpos <= vpos;
        end
    end
    
    // Horizontal Sync
    always @*
    begin
        if (hpos >= (h_back_porch + h_active + h_front_porch)) begin
            hsync <= 0;
        end else begin
            hsync <= 1;
        end
    end
    
    // Vertical Sync
    always @*
    begin
        if (vpos >= (v_back_porch + v_active + v_front_porch)) begin
            vsync <= 0;
        end else begin
            vsync <= 1;
        end
    end
    
    // Active
    always @*
    begin
        if (vpos >= v_back_porch && vpos < (v_back_porch + v_active) && hpos >= h_back_porch && hpos < (h_back_porch + h_active)) begin
            active <= 1;            
        end else begin
            active <= 0;
        end
    end  
    
    assign x = active ? (hpos - h_back_porch) : 0;  
    assign y = active ? (vpos - v_back_porch) : 0;  
endmodule