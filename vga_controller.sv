module vga_controller (
    input wire clk,        // 25 MHz clock
    input wire reset,
    output wire hsync,
    output wire vsync,
    output wire video_on,
    output wire [9:0] x,   // pixel x (0–639)
    output wire [9:0] y    // pixel y (0–479)
);

// VGA 640x480 @60Hz timing constants
parameter H_VISIBLE = 640;
parameter H_FRONT   = 16;
parameter H_SYNC    = 96;
parameter H_BACK    = 48;
parameter H_TOTAL   = 800;

parameter V_VISIBLE = 480;
parameter V_FRONT   = 10;
parameter V_SYNC    = 2;
parameter V_BACK    = 33;
parameter V_TOTAL   = 525;

reg [9:0] h_count = 0;
reg [9:0] v_count = 0;

// Horizontal counter
always @(posedge clk or posedge reset) begin
    if (reset)
        h_count <= 0;
    else if (h_count == H_TOTAL - 1)
        h_count <= 0;
    else
        h_count <= h_count + 1;
end

// Vertical counter
always @(posedge clk or posedge reset) begin
    if (reset)
        v_count <= 0;
    else if (h_count == H_TOTAL - 1) begin
        if (v_count == V_TOTAL - 1)
            v_count <= 0;
        else
            v_count <= v_count + 1;
    end
end

// Sync signals (active low)
assign hsync = ~(h_count >= (H_VISIBLE + H_FRONT) &&
                 h_count <  (H_VISIBLE + H_FRONT + H_SYNC));

assign vsync = ~(v_count >= (V_VISIBLE + V_FRONT) &&
                 v_count <  (V_VISIBLE + V_FRONT + V_SYNC));

// Video enable
assign video_on = (h_count < H_VISIBLE) && (v_count < V_VISIBLE);

// Pixel coordinates
assign x = h_count;
assign y = v_count;

endmodule
