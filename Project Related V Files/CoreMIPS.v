`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:58:36 03/03/2016 
// Design Name: 
// Module Name:    CoreMIPS 
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
module CoreMIPS(
clk,
enable,
sf_e,
e,
rs,
rw,
nibble
    );

//Inputs
input clk, enable;

//Outputs
output sf_e; //1 LCD access 
output e; //enable (1)
output rs; //Register Select (1 data bits for R/W)
output rw; //Read/Write, 1/0
output [3:0] nibble; //to form a nibble

wire [31:0] RegisterContent;
wire [4:0] RegisterNo;

LCD Lcd_Controller (
.clk(clk), //Master Clk High Freq
.sf_e(sf_e),
.e(e),
.rs(rs),
.rw(rw),
.nibble(nibble)
    );

Mips_Pip_CPU Processor(
.clk(clk),
.RegisterContent(RegisterContent),
.RegisterNo(RegisterNo)
 );

endmodule
