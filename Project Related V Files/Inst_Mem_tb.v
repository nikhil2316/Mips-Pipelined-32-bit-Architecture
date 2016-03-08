`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:29:42 10/28/2015
// Design Name:   Inst_Mem
// Module Name:   E:/Xilinx/MIPS_Pip/Inst_Mem_tb.v
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

module Inst_Mem_tb;

	// Inputs
	reg [31:0] PC;

	// Outputs
	wire [31:0] Inst;

	// Instantiate the Unit Under Test (UUT)
	Inst_Mem uut (
		.PC(PC), 
		.Inst(Inst)
	);
integer i;
	initial begin
		// Initialize Inputs
		PC = 0;
		
		
		for(i=0;i<32;i=i+1)
		begin
			uut.regfile[i]=i;
			$display("regfile[%d]=%d",i,uut.regfile[i]);
		end
		$monitor("PC=%d  Inst=%d",PC,Inst);
		
		

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	initial
	forever 	#5 PC=PC+1;
	
      
endmodule

