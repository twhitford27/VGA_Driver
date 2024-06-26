`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.06.2024 22:30:28
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
        input CLK100MHZ,
        input rst_btn,


        output VGA_HS,
        output VGA_VS,
        output [3:0] VGA_R,
        output [3:0] VGA_B,
        output [3:0] VGA_G
    );
    wire rst;
    wire clk_25M;
    wire enable_V;
    wire [15:0] H_Count;
    wire [15:0] V_Count;

    assign rst = rst_btn;


    clk_divider VGA_Clock(
        .clk(CLK100MHZ),
        .out(clk_25M),
        .rst(rst)
        );

    Horizontal_VGA VGA_Horiz(
        .clk_25MHz(clk_25M),
        .enable_V(enable_V),
        .H_Count(H_Count)
    );


    Vertical_VGA VGA_Vert (
        .clk_25MHz(clk_25M),
        .enable_V(enable_V),
        .V_Count(V_Count)
    );

    assign VGA_HS = (H_Count < 96) ? 1'b1:1'b0;
    assign VGA_VS = (V_Count < 2) ? 1'b1:1'b0;

    assign VGA_R = (H_Count < 784 && H_Count > 143 && V_Count < 515 && V_Count >34) ? 4'hF:4'h0;
    assign VGA_G = (H_Count < 784  && H_Count > 143 && V_Count < 515 && V_Count >34) ? 4'hF:4'h0;
    assign VGA_B = (H_Count < 784 && H_Count > 143 && V_Count < 515 && V_Count >34) ? 4'hF:4'h0;


endmodule

