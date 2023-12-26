`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 08:47:36 PM
// Design Name: 
// Module Name: FactDatapath
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


module FactDatapath #(parameter Data_Width = 32)(
    input [3:0] n,
    input Sel,
    input Load_reg,
    input Load_cnt,
    input OE,
    input EN,
    input CLK,
    output GRT1,
    output GRT12,
    output [Data_Width - 1:0] Product
    );
    wire [3:0] CNT_Out;
    wire [Data_Width - 1:0] MUX_Out;
    wire [Data_Width - 1:0] REG_Out;
    wire [Data_Width - 1:0] MUL_Out;
    
    Comparator #(4) CMP_INP (.A(n), .B(4'd12), .GT(GRT12));
    Comparator #(4) CMP_FACT (.A(CNT_Out), .B(4'b1), .GT(GRT1));
    Counter #(4) COUNTER (.D(n), .Q(CNT_Out), .Load_cnt(Load_cnt), .EN(EN), .CLK(CLK));
    Multiplier #(32) MUL (.x({28'b0,CNT_Out}), .y(REG_Out), .z(MUL_Out));
    Multiplexer #(32) MUX (.inp2(32'b1), .inp1(MUL_Out), .Sel(Sel), .Out(MUX_Out));
    Multiplexer #(32) OUT_BUFFER (.inp1(32'b0), .inp2(REG_Out), .Sel(OE), .Out(Product));
    Register #(32) REG (.D(MUX_Out), .Q(REG_Out), .Load_reg(Load_reg), .CLK(CLK));
endmodule
