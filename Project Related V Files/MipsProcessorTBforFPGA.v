`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:07:05 10/31/2015
// Design Name:   Mips_Pip_CPU
// Module Name:   E:/Xilinx/MIPS_Pip/MipsProcessorTBforFPGA.v
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

module MipsProcessorTBforFPGA;

	// Inputs
	reg clk, reset;

	parameter MEM_SIZE = 32'd512;// Inst Mem size
   parameter ExceptionAddr = MEM_SIZE - 32'd120;//leaving last 30 inst addresses
	
	wire [31:0] PCOut;
	wire [31:0] Inst;
	
	wire [31:0] RegisterContent, DataAddr, Data;
	wire [4:0] RegisterNo;
 
	
// Instantiate the module
Mips_Pip_CPU #(MEM_SIZE, ExceptionAddr)uut (
    .clk(clk), 
    .RegisterContent(RegisterContent), 
    .RegisterNo(RegisterNo), 
    .PC(PCOut), 
    .Instruction(Inst), 
    .DataAddr(DataAddr), 
    .Data(Data),
	 .reset(reset)
    );
	 
	integer i, clk_cycle;
	reg [31:0] PC;
	
	reg [7:0] regfile[0:MEM_SIZE-1];
	assign Inst =  {regfile[PCOut],regfile[PCOut+1],regfile[PCOut+2],regfile[PCOut+3]};
	
	initial
	begin : clk_initialization
		clk=1;
		clk_cycle =0;
	end
	
	parameter T = 20;
	
	always 
	begin : clk_generator
		#(T/2) clk = ~clk;
	end
	
	always @(posedge clk)
	begin : to_print_clk_cycle_no
		clk_cycle = clk_cycle+1;
		$display("------------------------------Clk_Cycle = %d (- 2)------------------------------", clk_cycle);
	end
	
	initial 
	begin : InstMem_Initialization
	PC = 32'd0;
	uut.s6.s0.regfile[0]=32'd1;
//--------------------------------------Load Inst. in Mem. at PC-------------------------------------------
	{regfile[PC],regfile[PC+1],regfile[PC+2],regfile[PC+3]} =32'b000000_00000_00000_00001_00000_100000;//r1=r0+r0;  //4
	PC=PC+4;
	{regfile[PC],regfile[PC+1],regfile[PC+2],regfile[PC+3]} =32'b100011_00000_00010_00000_00000_000000;//r2 = Memory[0]; //5
	PC=PC+4;
	{regfile[PC],regfile[PC+1],regfile[PC+2],regfile[PC+3]} =32'b000000_00000_00010_00100_00000_100000;//r4=r2+r0; //7
	PC=PC+4;
	{regfile[PC],regfile[PC+1],regfile[PC+2],regfile[PC+3]} =32'b001000_00000_00101_00000_00000_000101;//r5=5+r0;  //8
	PC=PC+4;
	
	// X:
	{regfile[PC],regfile[PC+1],regfile[PC+2],regfile[PC+3]} =32'b000000_00001_00010_00011_00000_100000;//r3=r2+r1;  //9 17  24   31   
	PC=PC+4;
	{regfile[PC],regfile[PC+1],regfile[PC+2],regfile[PC+3]} =32'b101011_00100_00011_00000_00000_000000;// Memory[r4]=r3; //10 18  25   32
	PC=PC+4;
	//{regfile[PC],regfile[PC+1],regfile[PC+2],regfile[PC+3]} =32'b001000_00100_00100_00000_00000_000001;//r4=r4+1;
	//PC=PC+4;
	{regfile[PC],regfile[PC+1],regfile[PC+2],regfile[PC+3]} =32'b000000_00000_00010_00001_00000_100000;//r1=r2+r0; //11  19    26   33
	PC=PC+4;
	{regfile[PC],regfile[PC+1],regfile[PC+2],regfile[PC+3]} =32'b000000_00000_00011_00010_00000_100000;//r2=r3+r0;  //12  20   27    34
	PC=PC+4;
	{regfile[PC],regfile[PC+1],regfile[PC+2],regfile[PC+3]} =32'b001000_00100_00100_00000_00000_000001;//r4=r4+1;  //13  21   28   35
	PC=PC+4;
	{regfile[PC],regfile[PC+1],regfile[PC+2],regfile[PC+3]} =32'b000101_00101_00100_11111_11111_111010;//PC=(r4!=r5)?(PC+4+4*(-6)):(PC+4); jump X cond. add. 1 clk cycle //15  23   30   37
	PC=PC+4;// in 11th clk cycle br inst come in ID
//	{regfile[PC],regfile[PC+1],regfile[PC+2],regfile[PC+3]} =32'b000010_00000_00000_00000_00000_010000;//jmp K;
//	PC=PC+4;
	{regfile[PC],regfile[PC+1],regfile[PC+2],regfile[PC+3]} =32'b100011_00000_00011_00000_00000_000000;//r3 = Memory[0]; 39
	PC=PC+4;
	

   ///////////////////////////////////////////////////////////////////////////////////////////////
	//                        |     IF    |    ID    |    EX    |    MEM   |    WB					//
	//                        _----- _____----- _____----- _____----- _____-----_____				//
	//																															//
	//           nextPC_ready|PC    Inst|Inst  Ctrl|Ctrl  Rslt|Rslt M_W&R|M_W&R   WB|				//
	///////////////////////////////////////////////////////////////////////////////////////////////
	end
	
	initial
	begin
		reset=1;
		#(2*T) reset=0;
	end
	
	initial
	begin : terminator
		//used by reset
		#(2*T);
		//Instr Execution
		#(39*T);
		$stop;
	end
   
endmodule

