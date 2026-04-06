module top (
    input wire clk,       // 25 MHz
    input wire reset,
    output wire hsync,
    output wire vsync,
    output wire [7:0] r,
    output wire [7:0] g,
    output wire [7:0] b
);

wire video_on;
wire [9:0] x, y;

// Raw color signals (test pattern)
wire [7:0] r_raw, g_raw, b_raw;

// Processed output
wire [7:0] r_proc, g_proc, b_proc;

// Instantiate VGA controller
vga_controller vga (
    .clk(clk),
    .reset(reset),
    .hsync(hsync),
    .vsync(vsync),
    .video_on(video_on),
    .x(x),
    .y(y)
);

// Simple test pattern (color bars)
assign r_raw = (x < 213) ? 8'hFF : 8'h00;
assign g_raw = (x >= 213 && x < 426) ? 8'hFF : 8'h00;
assign b_raw = (x >= 426) ? 8'hFF : 8'h00;

// Image processing block
image_processing proc (
    .r_in(r_raw),
    .g_in(g_raw),
    .b_in(b_raw),
    .enable(1'b1),  // always enabled
    .r_out(r_proc),
    .g_out(g_proc),
    .b_out(b_proc)
);

// Output only when video is active
assign r = video_on ? r_proc : 8'h00;
assign g = video_on ? g_proc : 8'h00;
assign b = video_on ? b_proc : 8'h00;

endmodule
