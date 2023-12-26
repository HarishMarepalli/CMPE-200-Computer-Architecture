`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 08:51:32 PM
// Design Name: 
// Module Name: FactControlpath
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


module FactControlpath(
    input Go,
    input CLK,
    input GRT1,
    input GRT12,
    output reg Sel,
    output reg Load_reg,
    output reg Load_cnt,
    output reg OE,
    output reg EN,
    output Done,
    output Error
    );
    //Next and Current State Registers
    reg [2:0] CS = 0, NS;
    reg Err_Internal = 0, Done_Internal = 0;
    
    assign Error = GRT12;
    assign Done = Done_Internal;
    
    //encode states
    parameter s0 = 3'd0, s1 = 3'd1, s2 = 3'd2, s3 = 3'd3, s4 = 3'd4;
              
    //Next State Logic (combinational) based on State Transition Diagram
    always @ (CS, Go)
    begin
        case (CS)
            s0:
            case({Go, GRT12})
                2'b11: {NS, Err_Internal} <= {s0, 1'b1};
                2'b10: {NS, Err_Internal} <= {s1, 1'b0};
                2'b0?: {NS, Err_Internal} <= {s0, 1'b0};
                default: NS = s0;
            endcase
        s1: NS <= s2;
        s2: NS <= GRT1 ? s4 : s3;
        s3: NS <= s0;
        s4: NS <= s2;
        endcase
    end
    
    //State Register (sequential)
    always @ (posedge CLK)
        CS = NS;
        
    //Output Logic
    always @ (CS)
    begin
        case (CS)
            s0:
            begin
                {Sel, Load_cnt, EN, Load_reg, OE, Done_Internal} <= 6'b1_1_1_0_0_0;
            end
            s1:
            begin
                {Sel, Load_cnt, EN, Load_reg, OE, Done_Internal} <= 6'b1_1_1_1_0_0;
            end
            s2:
            begin
                {Sel, Load_cnt, EN, Load_reg, OE, Done_Internal} <= 6'b0_0_0_0_0_0;
            end
            s3:
            begin
                {Sel, Load_cnt, EN, Load_reg, OE, Done_Internal} <= 6'b0_0_0_0_1_1;
            end
            s4:
            begin
                {Sel, Load_cnt, EN, Load_reg, OE, Done_Internal} <= 6'b0_0_1_1_0_0;
            end
        endcase
    end
endmodule
