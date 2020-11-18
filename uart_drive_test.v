`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:27:00 06/02/2020
// Design Name:   uart_drive
// Module Name:   D:/Xilinx/voltage_sample/uart_drive_test.v
// Project Name:  voltage_sample
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: uart_drive
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module uart_drive_test;

	// Inputs
	reg clk;
	reg rst_n;
	reg [19:0] dec;
	reg sign;
	reg uart_we;

	// Outputs
	wire tx_reg;
	wire uart_end;

	// Instantiate the Unit Under Test (UUT)
	uart_drive uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.dec(dec), 
		.sign(sign), 
		.uart_we(uart_we), 
		.tx_reg(tx_reg), 
		.uart_end(uart_end)
	);
always#10 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		dec = 0;
		sign = 0;
		rst_n = 0;

		// Wait 100 ns for global reset to finish
		#50 rst_n = 1'b1;
		#100 dec =  20'b0110_0101_0101_0011_0101;
      #100 uart_we = 1; 
		// Add stimulus here

	end
      
endmodule

