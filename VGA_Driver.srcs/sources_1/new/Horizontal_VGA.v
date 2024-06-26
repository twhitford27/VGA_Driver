
`timescale 1ns / 1ps

module Horizontal_VGA(
    input clk_25MHz,
    output reg enable_V = 0,
    output reg [15:0] H_Count = 0
);

always @(posedge clk_25MHz) begin
    if (H_Count < 799)begin
        H_Count = H_Count + 1;
        enable_V <= 0;
    end else begin
        H_Count <= 0;
        enable_V <= 1;
    end
    
end

endmodule