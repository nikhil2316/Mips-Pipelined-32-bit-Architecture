`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:09:24 10/31/2015
// Design Name:   Inst_Mem
// Module Name:   E:/Xilinx/MIPS_Pip/COMptb.v
// Project Name:  MIPS_Pip
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Inst_Mem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module COMptb;

	// Inputs
	reg [31:0] PC;

	// Outputs
	wire [31:0] Inst;

	// Instantiate the Unit Under Test (UUT)
	Inst_Mem uut (
		.PC(PC), 
		.Inst(Inst)
	);

	initial begin
		// Initialize Inputs
		PC = 0;
		{uut.regfile[PC],uut.regfile[PC+1],uut.regfile[PC+2],uut.regfile[PC+3]} =32'b000000_00000_00001_00010_00000_100000;
		$display("InstMem[%d] = %b",PC,{uut.regfile[PC],uut.regfile[PC+1],uut.regfile[PC+2],uut.regfile[PC+3]});
		PC=0;
		#0;
		$display("InstMem[%d] = %b",PC,Inst);
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

