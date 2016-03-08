`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:07:05 10/31/2015
// Design Name:   Mips_Pip_CPU
// Module Name:   E:/Xilinx/MIPS_Pip/CPUtb.v
// Project Name:  MIPS_Pip
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mips_Pip_CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPUtb;

	// Inputs
	reg clk;

	// Instantiate the Unit Under Test (UUT)
	Mips_Pip_CPU uut (
		.clk(clk)
	);
	reg [31:0] PC;
	reg PC_old;
	initial begin

// Initialize RegBank if necessary
		//uut.s2.s0.regfile[0]=32'd0;//R0=0;
		uut.s2.s0.regfile[1]=32'd2;//R1=1;
		uut.s2.s0.regfile[2]=-32'd1;//R2=0;
//		uut.s2.s0.regfile[3]=32'd1;
//		uut.s2.s0.regfile[4]=32'd0;
//		uut.s2.s0.regfile[5]=32'd0;
//		uut.s2.s0.regfile[6]=32'd0;
//		uut.s2.s0.regfile[7]=32'd0;
//		uut.s2.s0.regfile[8]=32'd19;
//		uut.s2.s0.regfile[9]=32'd20;
//		uut.s2.s0.regfile[10]=32'd0;
		
//Data Mem initialise
		uut.s6.s0.regfile[32]=32'd45;
		uut.s6.s0.regfile[1]=32'd68;
			
// Initialize PC
	PC = 32'd0;
	
// Load Inst. in Mem. at PC
	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b100011_00010_00001_00000_00000_100001;//r1 = Memory[32];
	PC=PC+4;
	//1 nop
//{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b000000_00100_00101_00110_00000_100000;
//PC=PC+4;
		{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b100011_00010_00011_00000_00000_100001;//r3 = Memory[32];
	PC=PC+4;
	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b000000_00000_00001_00010_00000_100000;;//r2=r1+r0;
	PC=PC+4;
	//2 nop
//		{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b000000_00000_00000_00000_00000_100000;
//	PC=PC+4;
//	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b000000_00100_00101_00110_00000_100000;
//	PC=PC+4;
	
	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b000000_00010_00010_00010_00000_100000;//r2=r2+r2;
	PC=PC+4;
		//2 nop
//		{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b000000_00000_00000_00000_00000_100000;
//	PC=PC+4;
//	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b000000_00100_00101_00110_00000_100000;
//	PC=PC+4;
	
	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b000000_00010_00010_00010_00000_100000;//r2=r2+r2;
	PC_old=PC;
	PC=PC+4;

	


	
	
//	// 3 NOP
//	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b000000_00100_00101_00110_00000_100000;
//	PC=PC+4;
//	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b000000_00100_00101_00110_00000_100000;
//	PC=PC+4;
//	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b000000_00100_00101_00110_00000_100000;
//	PC=PC+4;
//	
//	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b000000_00001_00010_00011_00000_100000;
//	PC=PC+4;
//	
//	//2 NOP
//	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b000000_00100_00101_00110_00000_100000;
//	PC=PC+4;
//	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b000000_00100_00101_00110_00000_100000;
//	PC=PC+4;
//	
//	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b101011_00000_00011_0000000000000010;		
//	PC=PC+4;
//	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b000000_00001_00010_00011_00000_011000;
//	PC=PC+4;
//	
//		//2 NOP
//	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b000000_00100_00101_00110_00000_100000;
//	PC=PC+4;
//	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b000000_00100_00101_00110_00000_100000;
//	PC=PC+4;
//	
//	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b101011_00000_00011_00000_00000_000011;
//	
	PC=0;	
//	$display("InstMem[%d] = %b",PC,{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]});
//	//clk=0; #1 clk=1 ; #1;
	uut.s0.PC = PC;#1;
//	$display("Inst Loaded...., InstMem[%d] = %b",uut.s0.PC,uut.s0.Inst);
//	
//	clk=0; #1 clk=1;#1;
//	$display("After 2nd PosEdge, Inst latched = %b PCPlus4 = %d",uut.s1.InstReg,uut.s1.PCPlus4Reg);
//	$display("PC=%d",uut.s0.PC);
//	clk=0; #1 clk=1;#1;
//	//$display(" 2nd Stage, PCPlus4=%d A=%d B=%d SignExtImme=%b Rt=%d Rd=%d Ex=%b MEM=%b WB=%b",uut.s2.PCPlus4Reg,uut.s2.OutA,uut.s2.OutB,uut.s2.SignExtImme,uut.s2.Rt,uut.s2.Rd,uut.s2.EX,uut.s2.MEM,uut.s2.WB);
//	$display("After 3rd PosEdge, PCPlus4=%d A=%d B=%d SignExtImme=%b Rt=%d Rd=%d Ex=%b MEM=%b WB=%b",uut.s3.PCPlus4Reg,uut.s3.AReg,uut.s3.BReg,uut.s3.SignExtImmeReg,uut.s3.RtReg,uut.s3.RdReg,uut.s3.EXReg,uut.s3.MEMReg,uut.s3.WBReg);
//	$display("PC=%d",uut.s0.PC);
//	clk=0; #1 clk=1;#1;
//	$display("After 4th PosEdge, PCPlus4PlusOff=%b Result=%d B=%d Equal=%b WrReg=%b MEM=%b WB=%b",uut.s5.PCPlus4PlusOffReg,uut.s5.ResultReg,uut.s5.OutBReg,uut.s5.EqualReg,uut.s5.WrRegReg,uut.s5.MEMReg,uut.s5.WBReg);
//	$display("PC=%d",uut.s0.PC);
//	clk=0; #1 clk=1;#1;//1st In
//	$display("After 5th PosEdge, MemOp=%b ResultRType=%d WrReg=%b WB=%b",uut.s7.MemOpReg,uut.s7.ResultRTypeReg,uut.s7.WrRegReg,uut.s7.WBReg);
//	//$display("PC=%d",uut.s0.PC);
//	clk=0; #1 clk=1;#1;//2nd Inst
////	$display("PC=%d",uut.s0.PC);
////	//$display("#######################################Inst. Executed##############################################");
//	clk=0; #1 clk=1;#1;
//	clk=0; #1 clk=1;#1;
//	
////	$display("R3=%b",uut.s2.s0.regfile[3]);
//	clk=0; #1 clk=1;#1;
//	clk=0; #1 clk=1;#1;//3rd inst
//	clk=0; #1 clk=1;#1;
//	clk=0; #1 clk=1;#1;
//	clk=0; #1 clk=1;#1;//4th Inst
//	$display("DM[0]=%d,DM[1]=%d,DM[2]=%d,DM[3]=%d",uut.s6.s0.regfile[0],uut.s6.s0.regfile[1],uut.s6.s0.regfile[2],uut.s6.s0.regfile[3]);
//
//	clk=0; #1 clk=1;#1;//5th Inst
//	clk=0; #1 clk=1;#1;
//	clk=0; #1 clk=1;#1;
//	clk=0; #1 clk=1;#1;//6th inst
//	$display("DM[0]=%d,DM[1]=%d,DM[2]=%d,DM[3]=%d",uut.s6.s0.regfile[0],uut.s6.s0.regfile[1],uut.s6.s0.regfile[2],uut.s6.s0.regfile[3]);
	//	$display("InstMem[%d] = %b",PC,{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]});
	$display("PC = %d",uut.s0.PC);
	clk=0;#1 clk=1; #1;
//	$display("PC = %d",uut.s0.PC);
	clk=0;#1 clk=1; #1;
//	$display("PC = %d",uut.s0.PC);
	clk=0;#1 clk=1; #1;
//	$display("PC = %d",uut.s0.PC);
	clk=0;#1 clk=1; #1; //1st inst and so on
//	$display("PC = %d",uut.s0.PC);
	clk=0;#1 clk=1; #1;
   clk=0;#1 clk=1; #1;
	clk=0;#1 clk=1; #1;// 2nd
	clk=0;#1 clk=1; #1;
//	clk=0;#1 clk=1; #1;
//	
//	clk=0;#1 clk=1; #1;//3rd so 4 clk cycle wasted
//	clk=0;#1 clk=1; #1;
//		clk=0;#1 clk=1; #1;
	//clk=0;#1 clk=1; #1;
	//$display("DM[0]=%d,DM[1]=%d,DM[2]=%d,DM[3]=%d",uut.s6.s0.regfile[0],uut.s6.s0.regfile[1],uut.s6.s0.regfile[2],uut.s6.s0.regfile[3]);
	$stop;
	end
      
endmodule

