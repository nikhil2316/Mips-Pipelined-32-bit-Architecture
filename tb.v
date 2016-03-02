`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:35:18 01/18/2016
// Design Name:   shivansh
// Module Name:   E:/Xilinx/MIPS_Pip/tb.v
// Project Name:  MIPS_Pip
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shivansh
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb;

	// Inputs
	reg loc;
	reg array;

	// Outputs
	wire c;

	// Instantiate the Unit Under Test (UUT)
	shivansh uut (
		.c(c), 
		.loc(loc), 
		.array(array)
	);

	initial begin
		// Initialize Inputs
		loc = 1;
		uut.array[1]=1;
		
		#1;
		

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

