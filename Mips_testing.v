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
// Additional Comments:In this Baranch Target Buffer is introduced. If BTB prediction is right, 1 clk cycle is saved
// 
////////////////////////////////////////////////////////////////////////////////

module CPUtb;

	// Inputs
	reg clk;

	parameter MEM_SIZE = 32'd512;// Inst Mem size
   parameter ExceptionAddr = MEM_SIZE - 32'd120;//leaving last 30 inst addresses
	// Instantiate the Unit Under Test (UUT)
	Mips_Pip_CPU #(MEM_SIZE,ExceptionAddr) uut (
		.clk(clk)
	);
	reg [31:0] PC;
	reg [31:0] PC_old;
	integer i;
	initial begin

// Initialize RegBank if necessary
		//uut.s2.s0.regfile[0]=32'd0;//R0=0;
//		uut.s2.s0.regfile[1]=32'd65;//R1=1;
//		uut.s2.s0.regfile[2]=32'd87;//R2=0;
//		uut.s2.s0.regfile[3]=32'd1;
//		uut.s2.s0.regfile[4]=32'd0;
//		uut.s2.s0.regfile[5]=32'd0;
//		uut.s2.s0.regfile[6]=32'd0;
//		uut.s2.s0.regfile[7]=32'd0;
//		uut.s2.s0.regfile[8]=32'd19;
//		uut.s2.s0.regfile[9]=32'd20;
//		uut.s2.s0.regfile[10]=32'd0;
		
//Data Mem initialize
		uut.s6.s0.regfile[0]=32'd1;
			
// Initialize PC
	PC = 32'd0;
/////////////////////////////////jmp inst///////////////////////////////////
//	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b000010_00000_00000_00000_00000_100000;//jmp K;
//	PC=PC+4;
//	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b000000_00001_00010_00011_00000_100000;//r3=r1+r2;
//	PC=PC+4;
////	K:
//	PC = 32'b100000;
//	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b000010_00001_00010_00011_00000_100010;//r3=r1-r2;
//	PC=PC+4;

//////////////////////////////////////////////////////////////////////////////////////////////
// Load Inst. in Mem. at PC
	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b000000_00000_00000_00001_00000_100000;//r1=r0+r0;  //5
	PC=PC+4;
	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b100011_00000_00010_00000_00000_000000;//r2 = Memory[0]; //6
	PC=PC+4;
	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b000000_00000_00010_00100_00000_100000;//r4=r2+r0; //8
	PC=PC+4;
	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b001000_00000_00101_00000_00000_000101;//r5=5+r0;  //9
	PC=PC+4;	
	
	// X:
	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b000000_00001_00010_00011_00000_100000;//r3=r2+r1;   //10 18 25 32
	PC=PC+4;
	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b101011_00100_00011_00000_00000_000000;// Memory[r4]=r3; //11 19
	PC=PC+4;
	//{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b001000_00100_00100_00000_00000_000001;//r4=r4+1;
	//PC=PC+4;
	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b000000_00000_00010_00001_00000_100000;//r1=r2+r0; //12 20
	PC=PC+4;
	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b000000_00000_00011_00010_00000_100000;//r2=r3+r0;  //13 21
	PC=PC+4;
	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b001000_00100_00100_00000_00000_000001;//r4=r4+1;  //14 22   36
	PC=PC+4;
	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b000101_00101_00100_11111_11111_111010;//PC=(r4!=r5)?(PC+4+4*(-6)):(PC+4); jump X cond. add. 1 clk cycle //16 24
	PC=PC+4;// in 11th clk cycle br inst come in ID
//	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b000010_00000_00000_00000_00000_010000;//jmp K;
//	PC=PC+4;
	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b100011_00000_00011_00000_00000_000000;//r3 = Memory[0]; //40
	PC=PC+4;
	
//		uut.s2.s0.regfile[1]=32'd1;//R1=-1;
//		uut.s2.s0.regfile[2]=32'h7FFF_FFFF;//R2=-1;
//	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b001000_00010_00010_00000_00000_000001;//r2=r2+1;
//	PC=PC+4;
//	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b111111_00010_00010_00000_00000_000001;//Undefined Inst
//	PC=PC+4;
//	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b100011_00000_00010_00000_00000_000000;//r2 = Memory[0];
//	PC=PC+4;
//	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b000101_00001_00010_00000_00000_000101;//PC=(r1!=r2)?(PC+4+4*5):(PC+4);
//	PC_old=PC;
//	PC=PC+4;
//	//1 nop
////	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b000000_00000_00000_00000_00000_100000;//r0=r0+r0;
////	PC=PC+4;
//	
//	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b100011_00000_00011_00000_00000_000000;//r3 = Memory[0];
//	PC=PC+4;
//	
///////branch instr////
//	PC=PC_old+4+4*5;
//	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b100011_00000_00100_00000_00000_000000;//r4 = Memory[0];
//	PC=PC+4;
//////Exception control//////////////
//	PC = ExceptionAddr;
//	{uut.s0.s0.regfile[PC],uut.s0.s0.regfile[PC+1],uut.s0.s0.regfile[PC+2],uut.s0.s0.regfile[PC+3]} =32'b100011_00000_00011_00000_00000_000000;//r3 = Memory[0];
//	PC=PC+4;
/////////////////////////////////////

////------------------------------------------------------------------------------
///////////////////////////////////////////////////////////////////////////////////////////////
	PC=0;	
	uut.s0.PC = PC;#1;
///////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////
//                        |     IF    |    ID    |    EX    |    MEM   |    WB
//                        _----- _____----- _____----- _____----- _____-----_____
//
//           nextPC_ready|PC    Inst|Inst  Ctrl|Ctrl  Rslt|Rslt M_W&R|M_W&R   WB|
///////////////////////////////////////////////////////////////////////////////////////////////
	clk = 0;#0.1;
	for(i=1;i<40;i=i+1)//40  18->26 now 18->25
	begin
		$display(" >>>>>>>>>>>>>>>>>>>> CLOCK CYCLE= %d<<<<<<<<<<<<<<<<<<<<<<, PC = %h",i+1,uut.s0.PC);
		clk=1; #1clk=0;#1 ;
	end
	for(i=0;i<7;i=i+1)
//	PC=PC_old+4+4*5;
		$display("DataMem[%d] = %d",i,uut.s6.s0.regfile[i]);
//$display("DataMem[%h] = %b", ExceptionAddr, uut.s0.s0.regfile[ ExceptionAddr ]);
//		
		//$display("%b",-6);
$stop;


	end
      
endmodule

