`timescale 1ns / 1ps

module clk_divider #(
    parameter                   COUNT_WIDTH = 2,
    parameter  [COUNT_WIDTH:0]  MAX_COUNT   = 1
)(

    //inputs
    input clk,
    input rst,

    output reg out
    );



    //internal signals
    reg [COUNT_WIDTH:0] count;
    

    always @(posedge clk or posedge rst) begin
        if (rst == 1'b1)begin
            count <= 0;
            out <= 0;
        end else if (count == MAX_COUNT)begin
            count <= 0;
            out <= ~out;
        end else begin
            count <= count + 1;
        end
    end


        
endmodule
