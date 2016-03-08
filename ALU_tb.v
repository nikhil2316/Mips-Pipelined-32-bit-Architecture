`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:03:12 10/28/2015
// Design Name:   ALU
// Module Name:   E:/Xilinx/MIPS_Pip/ALU_tb.v
// Project Name:  MIPS_Pip
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_tb;

	// Inputs
	reg [3:0] ALUCon;
	reg [31:0] DataA;
	reg [31:0] DataB;

	// Outputs
	wire [31:0] Result;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.ALUCon(ALUCon), 
		.DataA(DataA), 
		.DataB(DataB), 
		.Result(Result)
	);
	
	initial begin
		// Initialize Inputs
		ALUCon = 0;
		DataA = 32'd9;
		DataB = 32'd2;
		$monitor("ALUcon %b Result %b  %d A=%b B %b ",ALUCon,Result,Result,DataA,DataB); 
#1  ALUCon = 0;		
		#1  ALUCon = 1;
		#1  ALUCon = 2;
		#1  ALUCon = 3;
		#1  ALUCon = 4;
		#1  ALUCon = 5;
		#1  ALUCon = 6;
		#1  ALUCon = 7;#1  ALUCon = 8;#1  ALUCon = 9;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

