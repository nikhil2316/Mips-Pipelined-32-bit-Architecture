`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:17:38 10/28/2015 
// Design Name: 
// Module Name:    Stage1 
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
module Stage1(
PCSrc,
PCPlus4PlusOff,
PCWrite,
JmpAddr,
ExceptionResumeAddr,
ChooseEPC,
PC_stage2,
WriteEntry,
PCPlus4,
Inst,
FindinBTB,
taken,
clk
    );

input [1:0] PCSrc;
input [2:0] WriteEntry;
input [31:0] PCPlus4PlusOff, PC_stage2;
input clk, PCWrite, ChooseEPC;
input [31:0] JmpAddr,ExceptionResumeAddr;

output [31:0] Inst,PCPlus4;
output FindinBTB,taken; 
reg [31:0] PC;
wire [31:0] NextPC,NewPC,FOUR, FinalPC;
wire [3:0] ALU_add ;
wire [31:0] dummy;

//assign PCPlus4 = PC+4;
assign ALU_add = 4'b0010;
assign FOUR = 32'b100;

parameter MEM_SIZE = 32'd511;

Inst_Mem #(MEM_SIZE) s0 (.PC(PC), .Inst(Inst));
ALU s1 (.ALUCon(ALU_add),.DataA(PC),.DataB(FOUR),.Result(PCPlus4));

//assign NextPC = (PCSrc == 1'b1)?(PCPlus4PlusOff):(PCPlus4);
Mux32_2_1 s2 (.A((WriteEntry[2])?(PC_stage2+32'd4):(PCPlus4)),.B(PCPlus4PlusOff),.S(PCSrc[0]),.Out(NextPC));//nextPC takes care of branch or PC+4
//ALU s1 (.ALUCon(ALU_add),.DataA(PC),.DataB(FOUR),.Result(dummy));
//assign NewPC = (PCWrite == 1'b0)? (PC):(NextPC);///////////////

//assign FinalPC = (ChooseEPC == 1'b1)?(ExceptionResumeAddr):((PCSrc[1])?(JmpAddr):(NextPC)); //FinalPC contains ExceptionResumeAddr if chooseEPC = 1 otherwise JmpAddr if it is a jmp inst otherwise nextPC
																															//chooseEPC = chooseExceptionResumeAddr	
wire [31:0] PC_predicted;
//wire taken, FindinBTB;
assign FinalPC = ((WriteEntry == 3'b000) && FindinBTB && taken )?(PC_predicted):((ChooseEPC == 1'b1)?(ExceptionResumeAddr):((PCSrc[1])?(JmpAddr):(NextPC)));

always @ (posedge clk)                                                                      
begin
	if(PCWrite == 1'b0)
		PC <= PC;
	else
		PC <= FinalPC;
end

//---------------------------BTB---------------------------------------------------
Branch_Target_Buffer BTB (
.PC(PC),
.PC_ip(PC_stage2),
.PC_predicted_ip(PCPlus4PlusOff),
.taken_ip(PCSrc[0]),
.PC_predicted(PC_predicted),
.taken(taken),
.WriteEntry(WriteEntry&{3{PCWrite}}),
.FindinBTB(FindinBTB),
.clk(clk)
);

//---------------------------------------------------------------------------------
 
endmodule
