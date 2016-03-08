`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:57:37 03/02/2016
// Design Name:   SampleRam
// Module Name:   E:/Xilinx/BTP MIPS ARCHITECTURE/MIPS_Pip/BlockRAMTB.v
// Project Name:  MIPS_Pip
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SampleRam
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module BlockRAMTB;

	// Inputs
	reg clka;
	reg [0:0] wea;
	reg [6:0] addra;
	reg [31:0] dina;

	// Outputs
	wire [31:0] douta;
	integer fl;
	// Instantiate the Unit Under Test (UUT)
	BlockRamFPGA uut (
		.clka(clka), 
		.wea(wea), 
		.addra(addra), 
		.dina(dina), 
		.douta(douta)
	);
	parameter T = 2;
	
//	always @ (clka)
//		#(T/2) clka <= ~clka;
		
//	always @ (posedge clka)
//	begin
//		if(addra == 7'd10)
//			addra <= 0;
//		else
//			addra <= addra + 1;
//		
//	end
//	
	always @ (douta)
	begin
		$fdisplay(fl,$time,"  clk %b addra %d douta %b wea %b dina %h",clka, addra, douta, wea, dina);
		
	end
	
	//Going to Verify Setup/Hold time for addra
	parameter active_edge_at = 10;
	parameter Latency = 10.51; //max of all <31 30 ..0>
	initial
	begin : clk_controller
		#100; //upto 100ns op is always zero on fpga. It is global reset time
		#active_edge_at clka=1;

	end
	
	parameter min_setup_time = 0.44; // All in ns
	parameter setup_time = 0.45;
	parameter min_hold_time = 2.84;
	parameter hold_time = 2.9;
	initial
	begin : addr_controller
		#100;
		fork 
			// Neither Setup nor Hold Voilation
			#(active_edge_at - setup_time + setup_time + 1 ) addra=1; //addra should be stable for setup time (> min_setup_time)before active edge
			#(active_edge_at + min_hold_time) addra=2;  //addra should be stable for hold time (> min_hold_time)after active edge
		join
		//#(active_edge_at + min_hold_time-(positive no)) it is hold time voilation
		//#(active_edge_at - setup_time + (pos no) ) it is setup time voilation
	end
	
	//so Tmin > Latency+Tsetup so T>10.51+0.44 = 10.95 or 11 ns or max 83 MHz
	initial begin
		// Initialize Inputs
		clka = 0;
		wea = 0;
		addra = 0;
		dina = 0;
		fl = $fopen("BlockRamOp.txt");
		// Wait 100 ns for global reset to finish
		#100;
		
		#100;
				//#20 wea=1;
		//#20 wea=0;
		$fclose(fl);
		$stop;
		
        
		// Add stimulus here

	end
      
endmodule

