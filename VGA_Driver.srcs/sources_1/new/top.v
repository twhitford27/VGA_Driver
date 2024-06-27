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
        input [2:0] btn,

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
    
    reg [3:0] VGA_R_REG;
    reg [3:0] VGA_B_REG;
    reg [3:0] VGA_G_REG;

    localparam PATTERN_0 = 3'b000;
    localparam PATTERN_1 = 3'b001;
    localparam PATTERN_2 = 3'b010;
    localparam PATTERN_3 = 3'b011;

    wire [3:0] Pattern_Red[0:3];
    wire [3:0] Pattern_Green[0:3];
    wire [3:0] Pattern_Blue[0:3];


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

    //pattern_0
    assign Pattern_Red[0] = (H_Count < 784 && H_Count > 143 && V_Count < 515 && V_Count >34) ? 4'hF:4'h0;
    assign Pattern_Green[0] = (H_Count < 784 && H_Count > 143 && V_Count < 515 && V_Count >34) ? 4'hF:4'h0;
    assign Pattern_Blue[0] = (H_Count < 784 && H_Count > 143 && V_Count < 515 && V_Count >34) ? 4'hF:4'h0;

    //pattern_1
    assign Pattern_Red[1] = (H_Count < 784 && H_Count > 143 && V_Count < 515 && V_Count >34) ? 4'hF:4'h0;
    assign Pattern_Green[1] = 4'h0;
    assign Pattern_Blue[1] = 4'h0;

    //pattern_2
    assign Pattern_Red[2] = 4'h0; 
    assign Pattern_Green[2] = (H_Count < 784 && H_Count > 143 && V_Count < 515 && V_Count >34) ? 4'hF:4'h0;
    assign Pattern_Blue[2] = 4'h0;

    //pattern3
    assign Pattern_Red[3] = 4'h0; 
    assign Pattern_Green[3] = 4'h0;
    assign Pattern_Blue[3] = (H_Count < 784 && H_Count > 143 && V_Count < 515 && V_Count >34) ? 4'hF:4'h0;

    always @(posedge CLK100MHZ) begin
        if(btn[0] == 1'b1)begin
            VGA_R_REG = Pattern_Red[1];
            VGA_G_REG = Pattern_Green[1];
            VGA_B_REG = Pattern_Blue[1];
        end else if (btn[1] == 1'b1)begin
            VGA_R_REG = Pattern_Red[2];
            VGA_G_REG = Pattern_Green[2];
            VGA_B_REG = Pattern_Blue[2];
        end else if (btn[2] == 1'b1)begin
            VGA_R_REG = Pattern_Red[3];
            VGA_G_REG = Pattern_Green[3];
            VGA_B_REG = Pattern_Blue[3];
        end else begin
            VGA_R_REG = Pattern_Red[0];
            VGA_G_REG = Pattern_Green[0];
            VGA_B_REG = Pattern_Blue[0];  
        end 
    end

    assign VGA_R = VGA_R_REG;
    assign VGA_G = VGA_G_REG;
    assign VGA_B = VGA_B_REG;

    // assign VGA_R = (H_Count < 784 && H_Count > 143 && V_Count < 515 && V_Count >34) ? 4'hF:4'h0;
    // assign VGA_G = (H_Count < 784  && H_Count > 143 && V_Count < 515 && V_Count >34) ? 4'hF:4'h0;
    // assign VGA_B = (H_Count < 784 && H_Count > 143 && V_Count < 515 && V_Count >34) ? 4'hF:4'h0;


endmodule

