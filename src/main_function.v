`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:32:15 06/01/2020 
// Design Name: 
// Module Name:    main_function 
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
module main_function(

   input             clk,
   input             rst_n,

	input [15:0] 		ad_data,            //ad7606 采样数据
	input        		ad_busy,            //ad7606 忙标志位 
   input        		first_data,         //ad7606 第一个数据标志位 	    
	output [2:0] 		ad_os,              //ad7606 过采样倍率选择
	output wire   		ad_cs,              //ad7606 AD cs
	output wire   		ad_rd,              //ad7606 AD data read
	output wire   		ad_reset,           //ad7606 AD reset
	output wire  		ad_convstab,         //ad7606 AD convert start
   
   output 	         tx_reg
    );
	 
parameter  CLK_FRE = 50;
parameter  BAUD_RATE = 115200;
parameter  SAMPLE_TIME = 20;//采样间隔时间 单位：毫秒ms
localparam sample = 0;
localparam wait_bcd = 1;
localparam bcd = 2;
localparam uart = 3;
localparam wait_tx = 4;

reg[31:0]  i;
reg[15:0]  ad_temp;
reg[3:0]   t;
reg[3:0]   state;
reg        uart_we;

wire[15:0] ad_ch1;
wire       uart_end;
wire[15:0] hex;
wire[7:0]  sign;
wire[19:0] dec;

always@(posedge clk or negedge rst_n)
begin
   if(!rst_n)
	   i <= 0;
   else if(state == sample)
      i <= 0;
   else
      i <= i+16'b1;	
end

always@(posedge clk or negedge rst_n)
begin
   if(!rst_n)
	   begin
		   state <= sample;
			uart_we <= 1'b0;
			ad_temp <= 16'b0;
		end
   else
	   case(state)
		    
			 sample:
			    begin
			       ad_temp <= ad_ch1;
					 state <= state+1;
					 t <= 4'b0;
				 end
			  
			 wait_bcd:
			    begin
			       if(t == 4'd8)
				       state <= state + 1;
				    else
				       t <= t+ 4'd1;
			    end
			 
          bcd:
             begin
					 state <= state +1;
				 end
			
			 uart:
			    begin
				    if(!uart_end)
 					    uart_we <= 1'b1;
					 else
					    begin
						    uart_we <= 1'b0;
							 state <= state + 1;
						 end
				 end
						 
			 wait_tx:
			    begin
				    if(i == SAMPLE_TIME*50000-1)
					    state <= sample;
					 else
					    state <= state;
				 end
			 
	   endcase
end				 
			 
			 

// uart发送
uart_drive uart_drive (
    .clk(clk), 
    .rst_n(rst_n), 
    .dec(dec), 
    .sign(sign), 
    .uart_we(uart_we), 
    .tx_reg(tx_reg), 
    .uart_end(uart_end)
    );

// 二进制转十进制
bcd _bcd (
    .clk(clk), 
    .hex(hex), 
    .dec(dec)
    );

//ad驱动程序	 
ad7606 ad7606 (
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
    .ad_ch1(ad_ch1), 
    .ad_ch2(ad_ch2), 
    .ad_ch3(ad_ch3), 
    .ad_ch4(ad_ch4), 
    .ad_ch5(ad_ch5), 
    .ad_ch6(ad_ch6), 
    .ad_ch7(ad_ch7), 
    .ad_ch8(ad_ch8)
    );	 

//电压转换	 
voltage_cal voltage_cal (
    .clk(clk), 
    .rst_n(rst_n), 
    .ad_temp(ad_temp), 
    .hex(hex), 
    .sign(sign)
    );
endmodule
