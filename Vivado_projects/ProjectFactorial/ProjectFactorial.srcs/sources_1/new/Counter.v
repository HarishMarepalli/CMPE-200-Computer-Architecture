`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 09:00:01 PM
// Design Name: 
// Module Name: Counter
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


module Counter #(parameter Data_Width = 4)(
    input [Data_Width - 1:0]D,
    input Load_cnt,
    input EN,
    input CLK,
    output reg [Data_Width - 1:0]Q
    );
    always @ (posedge CLK)
    begin
        if(EN)
        begin
            if(Load_cnt)
                Q <= D;
            else
            begin
                Q <= Q - 1'b1;
            end
        end
    end
endmodule
