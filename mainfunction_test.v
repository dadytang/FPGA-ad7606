`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:01:26 06/03/2020
// Design Name:   main_function
// Module Name:   D:/Xilinx/voltage_sample/mainfunction_test.v
// Project Name:  voltage_sample
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main_function
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mainfunction_test;

	// Inputs
	reg clk;
	reg rst_n;
	reg [15:0] ad_data;
	reg ad_busy;
	reg first_data;

	// Outputs
	wire [2:0] ad_os;
	wire ad_cs;
	wire ad_rd;
	wire ad_reset;
	wire ad_convstab;
	wire tx_reg;

	// Instantiate the Unit Under Test (UUT)
	main_function uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.ad_data(ad_data), 
		.ad_busy(ad_busy), 
		.first_data(first_data), 
		.ad_os(ad_os), 
		.ad_cs(ad_cs), 
		.ad_rd(ad_rd), 
		.ad_reset(ad_reset), 
		.ad_convstab(ad_convstab), 
		.tx_reg(tx_reg)
	);
   always#10 clk=~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 0;
		ad_data = 16'b1111_1111_1111_1111;
		ad_busy = 0;
		first_data = 0;

		// Wait 100 ns for global reset to finish
		#100 rst_n = 1;
		#300_0000 ad_data = 16'b0000_1111_1111_1111;
        
		// Add stimulus here

	end
      
endmodule

