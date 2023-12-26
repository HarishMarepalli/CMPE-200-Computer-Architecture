`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 09:00:01 PM
// Design Name: 
// Module Name: Multiplexer
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


module Multiplexer #(parameter Data_Width = 32)(
    input [Data_Width - 1:0] inp1,
    input [Data_Width - 1:0] inp2,
    input Sel,
    output reg [Data_Width - 1:0] Out
    );
    always @ (inp1, inp2, Sel)
        begin
            if(Sel)
                Out <= inp2;
            else
                Out <= inp1;
        end
endmodule
