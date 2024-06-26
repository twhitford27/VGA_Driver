`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.06.2024 23:08:09
// Design Name: 
// Module Name: VGA_tb
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


module VGA_tb(

    );

    reg CLK100MHZ;
    reg rst_btn;


    wire VGA_HS;
    wire VGA_VS;
    wire [3:0] VGA_R;
    wire [3:0] VGA_B;
    wire [3:0] VGA_G;

    top uut(
        .CLK100MHZ(CLK100MHZ),
        .rst_btn(rst_btn),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS),
        .VGA_R(VGA_R),
        .VGA_B(VGA_B),
        .VGA_G(VGA_G)
        );

    always begin
        #5 CLK100MHZ = ~CLK100MHZ;
    end
endmodule
