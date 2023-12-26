`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 08:39:51 PM
// Design Name: 
// Module Name: FactorialModule
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


module FactorialModule(
    input Go,
    input CLK,
    input [3:0] n,
    output Done,
    output Error,
    output [31:0] FactOut
    );
    wire Sel, Load_reg, Load_cnt, OE, EN;
    wire GRT12, GRT1;
    
    FactDatapath DP (
        .CLK(CLK),
        .EN(EN),
        .n(n),
        .Sel(Sel),
        .Load_reg(Load_reg),
        .Load_cnt(Load_cnt),
        .OE(OE),
        .GRT12(GRT12),
        .GRT1(GRT1),
        .Product(FactOut)
    );
    
    FactControlpath CU (
        .EN(EN),
        .Go(Go),
        .CLK(CLK),
        .Sel(Sel),
        .Load_reg(Load_reg),
        .Load_cnt(Load_cnt),
        .OE(OE),
        .GRT1(GRT1),
        .GRT12(GRT12),
        .Done(Done),
        .Error(Error)
    );
endmodule
