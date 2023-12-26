`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 09:00:01 PM
// Design Name: 
// Module Name: Register
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


module Register #(parameter Data_Width = 32)(
    input [Data_Width - 1:0] D,
    input Load_reg,
    input CLK,
    output reg [Data_Width - 1:0] Q
    );
    always @ (posedge CLK)
    begin
        if(Load_reg)
            Q <= D;
    end 
endmodule
