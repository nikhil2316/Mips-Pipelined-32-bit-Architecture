`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:06:43 10/29/2015 
// Design Name: 
// Module Name:    IFID 
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
module IFID(
PCPlus4,
Inst,
IF_ID_Write,
IF_ID_Flush_excep,
PCSrc,
FindinBTB,
taken,
PCPlus4Reg,
InstReg,
FindinBTBReg,
takenReg,
clk
    );
	 
input [31:0] PCPlus4,Inst;
input clk,IF_ID_Write,IF_ID_Flush_excep, FindinBTB, taken;
input [2:0] PCSrc; //PCSrc[2] = BTB takes wrong branch so need to insert a bubble in stage 2

output [31:0] PCPlus4Reg, InstReg;
reg [31:0] PCPlus4Reg, InstReg;

output FindinBTBReg, takenReg;
reg FindinBTBReg, takenReg;

wire [31:0] Instruction;
wire [31:0] NOP;

assign NOP = 32'b000000_00000_00000_00000_00000_100000;
assign Instruction = (IF_ID_Flush_excep || PCSrc[1] || PCSrc[0] || PCSrc[2])?(NOP):(Inst);

always @ (posedge clk)
begin
	if(IF_ID_Write == 1'b0)
	begin
	end
	else
	begin
		PCPlus4Reg <= PCPlus4;
		InstReg <= Instruction;
		FindinBTBReg <= FindinBTB;
		takenReg <= taken;
	end
end



endmodule
