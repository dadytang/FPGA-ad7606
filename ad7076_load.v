`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:27:04 03/10/2020 
// Design Name: 
// Module Name:    ad7076_load 
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
module ad7076_load(
    input clk,
	 input rst_n,
	 input ad_data_in,
	 input firstdata,
	 input ad_busy,
	 output ad_cs,
    output ad_rd,
    output ad_rst,
	 output convst,
	 output[2:0] ad_os,
	 output reg[15:0] ads_data_1,
	 output reg[15:0] ads_data_2,
	 output reg[15:0] ads_data_3,
	 output reg[15:0] ads_data_4,
	 output reg[15:0] ads_data_5,
	 output reg[15:0] ads_data_6,
	 output reg[15:0] ads_data_7,
	 output reg[15:0] ads_data_8,
	 output reg[15:0] ads_data_9,
	 output reg[15:0] ads_data_10,
	 	 output reg[15:0] ads_data_11,
	 output reg[15:0] ads_data_12,
	 output reg[15:0] ads_data_13,
	 output reg[15:0] ads_data_14,
	 output reg[15:0] ads_data_15,
	 output reg[15:0] ads_data_16,
	 output reg[15:0] ads_data_17,
	 output reg[15:0] ads_data_18,
	 output reg[15:0] ads_data_19,
	 output reg[15:0] ads_data_20,
	 	 output reg[15:0] ads_data_21,
	 output reg[15:0] ads_data_22,
	 output reg[15:0] ads_data_23,
	 output reg[15:0] ads_data_24,
	 output reg[15:0] ads_data_25,
	 output reg[15:0] ads_data_26,
	 output reg[15:0] ads_data_27,
	 output reg[15:0] ads_data_28,
	 output reg[15:0] ads_data_29,
	 output reg[15:0] ads_data_30,
	 	 output reg[15:0] ads_data_31,
	 output reg[15:0] ads_data_32,
	 output reg[15:0] ads_data_33,
	 output reg[15:0] ads_data_34,
	 output reg[15:0] ads_data_35,
	 output reg[15:0] ads_data_36,
	 output reg[15:0] ads_data_37,
	 output reg[15:0] ads_data_38,
	 output reg[15:0] ads_data_39,
	 output reg[15:0] ads_data_40,
	 	 output reg[15:0] ads_data_41,
	 output reg[15:0] ads_data_42,
	 output reg[15:0] ads_data_43,
	 output reg[15:0] ads_data_44,
	 output reg[15:0] ads_data_45,
	 output reg[15:0] ads_data_46,
	 output reg[15:0] ads_data_47,
	 output reg[15:0] ads_data_48,
	 output reg[15:0] ads_data_49,
	 output reg[15:0] ads_data_50,
	 	 output reg[15:0] ads_data_51,
	 output reg[15:0] ads_data_52,
	 output reg[15:0] ads_data_53,
	 output reg[15:0] ads_data_54,
	 output reg[15:0] ads_data_55,
	 output reg[15:0] ads_data_56,
	 output reg[15:0] ads_data_57,
	 output reg[15:0] ads_data_58,
	 output reg[15:0] ads_data_59,
	 output reg[15:0] ads_data_60,
	 	 output reg[15:0] ads_data_61,
	 output reg[15:0] ads_data_62,
	 output reg[15:0] ads_data_63,
	 output reg[15:0] ads_data_64,
	 output reg   sample_done
    );

wire ad_data_valid;
wire ad_data_1;
wire ad_data_2;
wire ad_data_3;
wire ad_data_4;
wire ad_data_5;
wire ad_data_6;
wire ad_data_7;
wire ad_data_8;
reg[7:0] i;
	 
always@(posedge clk or negedge rst_n)
begin
  if(~rst_n)
    begin
	   i <= 8'b0;
	 end
  else if(ad_data_valid)
	 begin
		if(i == 8'd64)
		 begin
		 i <= 8'b0;
		 sample_done <= 1'b1;
		 end
		else
		 begin
		  sample_done <= 1'b0;
		  case(i)
		    8'd0: begin ads_data_1 <= ad_data_1; i<=i+8'd1; end
			 8'd1: begin ads_data_2 <= ad_data_1; i<=i+8'd1; end
			 8'd2: begin ads_data_3 <= ad_data_1; i<=i+8'd1; end
			 8'd3: begin ads_data_4 <= ad_data_1; i<=i+8'd1; end
			 8'd4: begin ads_data_5 <= ad_data_1; i<=i+8'd1; end
			 8'd5: begin ads_data_6 <= ad_data_1; i<=i+8'd1; end
			 8'd6: begin ads_data_7 <= ad_data_1; i<=i+8'd1; end
			 8'd7: begin ads_data_8 <= ad_data_1; i<=i+8'd1; end
			 8'd8: begin ads_data_9 <= ad_data_1; i<=i+8'd1; end
			 8'd9: begin ads_data_10 <= ad_data_1; i<=i+8'd1; end
			 8'd10: begin ads_data_11 <= ad_data_1; i<=i+8'd1; end
			 8'd11: begin ads_data_12 <= ad_data_1; i<=i+8'd1; end
			 8'd12: begin ads_data_13 <= ad_data_1; i<=i+8'd1; end
			 8'd13: begin ads_data_14 <= ad_data_1; i<=i+8'd1; end
			 8'd14: begin ads_data_15 <= ad_data_1; i<=i+8'd1; end
			 8'd15: begin ads_data_16 <= ad_data_1; i<=i+8'd1; end
			 8'd16: begin ads_data_17 <= ad_data_1; i<=i+8'd1; end
			 8'd17: begin ads_data_18 <= ad_data_1; i<=i+8'd1; end
			 8'd18: begin ads_data_19 <= ad_data_1; i<=i+8'd1; end
			 8'd19: begin ads_data_20 <= ad_data_1; i<=i+8'd1; end
			 8'd20: begin ads_data_21 <= ad_data_1; i<=i+8'd1; end
			 8'd21: begin ads_data_22 <= ad_data_1; i<=i+8'd1; end
			 8'd22: begin ads_data_23 <= ad_data_1; i<=i+8'd1; end
			 8'd23: begin ads_data_24 <= ad_data_1; i<=i+8'd1; end
			 8'd24: begin ads_data_25 <= ad_data_1; i<=i+8'd1; end
			 8'd25: begin ads_data_26 <= ad_data_1; i<=i+8'd1; end
			 8'd26: begin ads_data_27 <= ad_data_1; i<=i+8'd1; end
			 8'd27: begin ads_data_28 <= ad_data_1; i<=i+8'd1; end
			 8'd28: begin ads_data_29 <= ad_data_1; i<=i+8'd1; end
			 8'd29: begin ads_data_30 <= ad_data_1; i<=i+8'd1; end
			 8'd30: begin ads_data_31 <= ad_data_1; i<=i+8'd1; end
			 8'd31: begin ads_data_32 <= ad_data_1; i<=i+8'd1; end
			 8'd32: begin ads_data_33 <= ad_data_1; i<=i+8'd1; end
			 8'd33: begin ads_data_34 <= ad_data_1; i<=i+8'd1; end
			 8'd34: begin ads_data_35 <= ad_data_1; i<=i+8'd1; end
			 8'd35: begin ads_data_36 <= ad_data_1; i<=i+8'd1; end
			 8'd36: begin ads_data_37 <= ad_data_1; i<=i+8'd1; end
			 8'd37: begin ads_data_38 <= ad_data_1; i<=i+8'd1; end
			 8'd38: begin ads_data_39 <= ad_data_1; i<=i+8'd1; end
			 8'd39: begin ads_data_40 <= ad_data_1; i<=i+8'd1; end
			 8'd40: begin ads_data_41 <= ad_data_1; i<=i+8'd1; end
			 8'd41: begin ads_data_42 <= ad_data_1; i<=i+8'd1; end
			 8'd42: begin ads_data_43 <= ad_data_1; i<=i+8'd1; end
			 8'd43: begin ads_data_44 <= ad_data_1; i<=i+8'd1; end
			 8'd44: begin ads_data_45 <= ad_data_1; i<=i+8'd1; end
			 8'd45: begin ads_data_46 <= ad_data_1; i<=i+8'd1; end
			 8'd46: begin ads_data_47 <= ad_data_1; i<=i+8'd1; end
			 8'd47: begin ads_data_48 <= ad_data_1; i<=i+8'd1; end
			 8'd48: begin ads_data_49 <= ad_data_1; i<=i+8'd1; end
			 8'd49: begin ads_data_50 <= ad_data_1; i<=i+8'd1; end
			 8'd50: begin ads_data_51 <= ad_data_1; i<=i+8'd1; end
			 8'd51: begin ads_data_52 <= ad_data_1; i<=i+8'd1; end
			 8'd52: begin ads_data_53 <= ad_data_1; i<=i+8'd1; end
			 8'd53: begin ads_data_54 <= ad_data_1; i<=i+8'd1; end
			 8'd54: begin ads_data_55 <= ad_data_1; i<=i+8'd1; end
			 8'd55: begin ads_data_56 <= ad_data_1; i<=i+8'd1; end
			 8'd56: begin ads_data_57 <= ad_data_1; i<=i+8'd1; end
			 8'd57: begin ads_data_58 <= ad_data_1; i<=i+8'd1; end
			 8'd58: begin ads_data_59 <= ad_data_1; i<=i+8'd1; end
			 8'd59: begin ads_data_60 <= ad_data_1; i<=i+8'd1; end
			 8'd60: begin ads_data_61 <= ad_data_1; i<=i+8'd1; end
			 8'd61: begin ads_data_62 <= ad_data_1; i<=i+8'd1; end
			 8'd62: begin ads_data_63 <= ad_data_1; i<=i+8'd1; end
			 8'd63: begin ads_data_64 <= ad_data_1; i<=i+8'd1; end
          default:i<=8'b0;
		 endcase
		end
	end
end
		
  

ad7076 U1 (
    .clk(clk), 
    .rst_n(rst_n), 
    .ad_data_in(ad_data_in), 
    .firstdata(firstdata), 
    .ad_busy(ad_busy), 
    .ad_cs(ad_cs), 
    .ad_rd(ad_rd), 
    .ad_rst(ad_rst), 
    .ad_data_valid(ad_data_valid), 
    .convst(convst), 
    .ad_os(ad_os), 
    .ad_data_1(ad_data_1), 
    .ad_data_2(ad_data_2), 
    .ad_data_3(ad_data_3), 
    .ad_data_4(ad_data_4), 
    .ad_data_5(ad_data_5), 
    .ad_data_6(ad_data_6), 
    .ad_data_7(ad_data_7), 
    .ad_data_8(ad_data_8)
    );

endmodule
