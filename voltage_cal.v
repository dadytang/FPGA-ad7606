`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:05:18 06/02/2020 
// Design Name: 
// Module Name:    voltage_cal 
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
module voltage_cal(
    input clk,
	 input rst_n,
	 input[15:0] ad_temp,
	 
	 output[15:0] hex,
	 output reg[7:0] sign
    );

reg[15:0]  ch1_reg;
reg[31:0]  ch1_data_reg;
reg[31:0]  _hex;

assign hex = _hex[15:0];
  
//AD 电压换算
always @(posedge clk)
begin
  if(!rst_n) 
  begin   
     ch1_reg<=0;
  end
  else 
  begin
    if(ad_temp[15]) 
	 begin                      //如果是负电压
	    ch1_reg<=16'hffff-ad_temp+1'b1;
       sign <= "-";                                 //'-' asic码
	 end	 
	 else 
	 begin
       ch1_reg<=ad_temp;
		 sign <= "+";                                  //'+' asic码		 
	 end
   end
end

//AD 电压换算(1 LSB = 5V / 32758 = 0.15mV
always @(posedge clk)
begin
  if(!rst_n) 
  begin   
     ch1_data_reg<=0;
     _hex <= 0;	
  end
  else 
  begin		 
		   ch1_data_reg<=ch1_reg * 50000;						
         _hex <= ch1_data_reg>>15;
  end	
end	
 
endmodule
