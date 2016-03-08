`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:18:58 10/28/2015 
// Design Name: 
// Module Name:    Inst_Mem_clk 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module Inst_Mem_clk(
PC,
Inst,
clk
    );

output [31:0] Inst;
reg [31:0] Inst;
input [31:0] PC;
input clk;

reg [31:0] regfile[511:0];

//assign Inst = regfile[PC];

always @ (posedge clk)
	Inst <= regfile[PC];


endmodule
