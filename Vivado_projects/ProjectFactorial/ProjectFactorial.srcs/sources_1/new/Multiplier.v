`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 09:00:01 PM
// Design Name: 
// Module Name: Multiplier
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


module Multiplier #(parameter Data_Width = 32)(
    input [Data_Width - 1:0] x,
    input [Data_Width - 1:0] y,
    output reg [Data_Width - 1:0] z
    );
    always @ (x or y)
        begin
            z <= x * y;
        end
endmodule
