`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.06.2024 22:42:27
// Design Name: 
// Module Name: Vertical_VGA
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


module Vertical_VGA(

    input clk_25MHz,
    input enable_V,
    output reg [15:0] V_Count = 0

    );

    always @(posedge clk_25MHz) begin
        if (enable_V == 1'b1)begin
            if(V_Count < 524) begin
                V_Count <= V_Count + 1;
            end else begin
                V_Count = 0;
            end
        end

        
    end
endmodule
