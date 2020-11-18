`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:47:43 03/11/2020
// Design Name:   ad7076_load
// Module Name:   D:/Xilinx/voltage_sample/ad7076_test.v
// Project Name:  voltage_sample
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ad7076_load
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ad7076_test;

	// Inputs
	reg clk;
	reg rst_n;
	reg[15:0] ad_data_in;
	reg firstdata;
	reg ad_busy;

	// Outputs
	wire ad_cs;
	wire ad_rd;
	wire ad_rst;
	wire convst;
	wire [2:0] ad_os;
	wire [15:0] ads_data_1;
	wire [15:0] ads_data_2;
	wire [15:0] ads_data_3;
	wire [15:0] ads_data_4;
	wire [15:0] ads_data_5;
	wire [15:0] ads_data_6;
	wire [15:0] ads_data_7;
	wire [15:0] ads_data_8;
	wire [15:0] ads_data_9;
	wire [15:0] ads_data_10;
	wire [15:0] ads_data_11;
	wire [15:0] ads_data_12;
	wire [15:0] ads_data_13;
	wire [15:0] ads_data_14;
	wire [15:0] ads_data_15;
	wire [15:0] ads_data_16;
	wire [15:0] ads_data_17;
	wire [15:0] ads_data_18;
	wire [15:0] ads_data_19;
	wire [15:0] ads_data_20;
	wire [15:0] ads_data_21;
	wire [15:0] ads_data_22;
	wire [15:0] ads_data_23;
	wire [15:0] ads_data_24;
	wire [15:0] ads_data_25;
	wire [15:0] ads_data_26;
	wire [15:0] ads_data_27;
	wire [15:0] ads_data_28;
	wire [15:0] ads_data_29;
	wire [15:0] ads_data_30;
	wire [15:0] ads_data_31;
	wire [15:0] ads_data_32;
	wire [15:0] ads_data_33;
	wire [15:0] ads_data_34;
	wire [15:0] ads_data_35;
	wire [15:0] ads_data_36;
	wire [15:0] ads_data_37;
	wire [15:0] ads_data_38;
	wire [15:0] ads_data_39;
	wire [15:0] ads_data_40;
	wire [15:0] ads_data_41;
	wire [15:0] ads_data_42;
	wire [15:0] ads_data_43;
	wire [15:0] ads_data_44;
	wire [15:0] ads_data_45;
	wire [15:0] ads_data_46;
	wire [15:0] ads_data_47;
	wire [15:0] ads_data_48;
	wire [15:0] ads_data_49;
	wire [15:0] ads_data_50;
	wire [15:0] ads_data_51;
	wire [15:0] ads_data_52;
	wire [15:0] ads_data_53;
	wire [15:0] ads_data_54;
	wire [15:0] ads_data_55;
	wire [15:0] ads_data_56;
	wire [15:0] ads_data_57;
	wire [15:0] ads_data_58;
	wire [15:0] ads_data_59;
	wire [15:0] ads_data_60;
	wire [15:0] ads_data_61;
	wire [15:0] ads_data_62;
	wire [15:0] ads_data_63;
	wire [15:0] ads_data_64;
	wire sample_done;

	// Instantiate the Unit Under Test (UUT)
	ad7076_load uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.ad_data_in(ad_data_in), 
		.firstdata(firstdata), 
		.ad_busy(ad_busy), 
		.ad_cs(ad_cs), 
		.ad_rd(ad_rd), 
		.ad_rst(ad_rst), 
		.convst(convst), 
		.ad_os(ad_os), 
		.ads_data_1(ads_data_1), 
		.ads_data_2(ads_data_2), 
		.ads_data_3(ads_data_3), 
		.ads_data_4(ads_data_4), 
		.ads_data_5(ads_data_5), 
		.ads_data_6(ads_data_6), 
		.ads_data_7(ads_data_7), 
		.ads_data_8(ads_data_8), 
		.ads_data_9(ads_data_9), 
		.ads_data_10(ads_data_10), 
		.ads_data_11(ads_data_11), 
		.ads_data_12(ads_data_12), 
		.ads_data_13(ads_data_13), 
		.ads_data_14(ads_data_14), 
		.ads_data_15(ads_data_15), 
		.ads_data_16(ads_data_16), 
		.ads_data_17(ads_data_17), 
		.ads_data_18(ads_data_18), 
		.ads_data_19(ads_data_19), 
		.ads_data_20(ads_data_20), 
		.ads_data_21(ads_data_21), 
		.ads_data_22(ads_data_22), 
		.ads_data_23(ads_data_23), 
		.ads_data_24(ads_data_24), 
		.ads_data_25(ads_data_25), 
		.ads_data_26(ads_data_26), 
		.ads_data_27(ads_data_27), 
		.ads_data_28(ads_data_28), 
		.ads_data_29(ads_data_29), 
		.ads_data_30(ads_data_30), 
		.ads_data_31(ads_data_31), 
		.ads_data_32(ads_data_32), 
		.ads_data_33(ads_data_33), 
		.ads_data_34(ads_data_34), 
		.ads_data_35(ads_data_35), 
		.ads_data_36(ads_data_36), 
		.ads_data_37(ads_data_37), 
		.ads_data_38(ads_data_38), 
		.ads_data_39(ads_data_39), 
		.ads_data_40(ads_data_40), 
		.ads_data_41(ads_data_41), 
		.ads_data_42(ads_data_42), 
		.ads_data_43(ads_data_43), 
		.ads_data_44(ads_data_44), 
		.ads_data_45(ads_data_45), 
		.ads_data_46(ads_data_46), 
		.ads_data_47(ads_data_47), 
		.ads_data_48(ads_data_48), 
		.ads_data_49(ads_data_49), 
		.ads_data_50(ads_data_50), 
		.ads_data_51(ads_data_51), 
		.ads_data_52(ads_data_52), 
		.ads_data_53(ads_data_53), 
		.ads_data_54(ads_data_54), 
		.ads_data_55(ads_data_55), 
		.ads_data_56(ads_data_56), 
		.ads_data_57(ads_data_57), 
		.ads_data_58(ads_data_58), 
		.ads_data_59(ads_data_59), 
		.ads_data_60(ads_data_60), 
		.ads_data_61(ads_data_61), 
		.ads_data_62(ads_data_62), 
		.ads_data_63(ads_data_63), 
		.ads_data_64(ads_data_64), 
		.sample_done(sample_done)
	);

always#10 clk=~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 0;
		ad_data_in = 0;
		firstdata = 0;
		ad_busy = 0;
		

		// Wait 100 ns for global reset to finish
		#100 rst_n = 1;
		ad_data_in = 16'b1010101010101010;
        
		// Add stimulus here

	end
      
endmodule

