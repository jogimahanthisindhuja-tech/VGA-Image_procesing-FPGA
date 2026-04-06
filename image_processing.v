module image_processing (
    input wire [7:0] r_in,
    input wire [7:0] g_in,
    input wire [7:0] b_in,
    input wire enable,
    output wire [7:0] r_out,
    output wire [7:0] g_out,
    output wire [7:0] b_out
);

// Example: Color inversion
assign r_out = enable ? ~r_in : r_in;
assign g_out = enable ? ~g_in : g_in;
assign b_out = enable ? ~b_in : b_in;

endmodule
