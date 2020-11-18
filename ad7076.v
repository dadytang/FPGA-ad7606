`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:58:09 03/06/2020 
// Design Name: 
// Module Name:    ad7076 
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
module ad7076
    (
	 input clk,
	 input rst_n,
	 input[15:0] ad_data_in,
	 input firstdata,
	 input ad_busy,
	 output reg ad_cs,
    output reg ad_rd,
    output reg ad_rst,
    output ad_data_valid,
	 output reg convst,
	 output[2:0] ad_os,
	 output reg[15:0] ad_data_1,
	 output reg[15:0] ad_data_2,
	 output reg[15:0] ad_data_3,
	 output reg[15:0] ad_data_4,
	 output reg[15:0] ad_data_5,
	 output reg[15:0] ad_data_6,
	 output reg[15:0] ad_data_7,
	 output reg[15:0] ad_data_8
    );

localparam start=0;
localparam convst_0=1;
localparam wait_busy=2;
localparam busy_1=3;
localparam rddata_1=4;
localparam rddata_2=5;
localparam rddata_3=6;
localparam rddata_4=7;
localparam rddata_5=8;
localparam rddata_6=9;
localparam rddata_7=10;
localparam rddata_8=11;
localparam done=12;
localparam wait_freq=13;

reg[15:0] rst_cnt;
reg[31:0] i;
reg[3:0] state;
//reg      ad_cs_1;

//assign ad_cs = ad_cs_1;
assign ad_os = 3'b000;
assign ad_data_valid = state==done?1'b1:1'b0;

always@(posedge clk or negedge rst_n)
begin
     if(~rst_n)
	    begin
	    ad_rst <= 1'b0;
	    rst_cnt <= 16'b0;
	    end
	  else if(rst_cnt==16'hffff)
		 ad_rst <= 1'b1;
	  else
	    begin
	    rst_cnt <= rst_cnt + 16'b1;
		 ad_rst <= 1'b0;
		 end
end

always@(posedge clk)
begin
     if(~ad_rst)
       begin
		 state <= start;
		 ad_cs <= 1'b1;
		 ad_rd <= 1'b1;
		 i <= 32'b0;
		 ad_data_1 <= 16'b0;
		 ad_data_2 <= 16'b0;
		 ad_data_3 <= 16'b0;
		 ad_data_4 <= 16'b0;
		 ad_data_5 <= 16'b0;
		 ad_data_6 <= 16'b0;
		 ad_data_7 <= 16'b0;
		 ad_data_8 <= 16'b0;
       end
     else
       begin
       case(state)
            start:
              begin
                if(i == 32'd20)
					   begin
					   state <= convst_0;
						i <= 32'd0;
						end
					 else
					   i <= i+32'd1;
				  end
				
				convst_0:
				  begin
				    if(i == 32'd2)
					   begin
						state <= wait_busy;
						convst <= 1'b1;
						end
					 else
					   begin
						i <= i+32'd1;
						convst <= 1'b0;
						end
				  end
				  
				wait_busy:
				    if(i==32'd5)
					   begin
					   state <= busy_1;
						i <= 32'd0;
						end
					 else
					    i <= i+32'd1;
				
				busy_1:
				    if(~ad_busy)
					   begin
					   i <= 32'd0;
					   state <= rddata_1;
					   end
                
            rddata_1: 
                begin
				    ad_cs<=1'b0;                              
				    if(i==3) 
				      begin
			         ad_rd<=1'b1;
				   	i <= 32'd0;
					   ad_data_1 <= ad_data_in;                        
					   state <= rddata_2;
				      end
				    else 
				      begin
					   ad_rd<=1'b0;
					   i <= i + 32'd1;
				      end
			       end
					 
            rddata_2:
                if(i==3)
                  begin
                  ad_rd <= 1'd1;
                  i <= 32'd0;
                  ad_data_2 <= ad_data_in;
                  state <= rddata_3;
                  end
                else
                  begin
                  ad_rd <= 1'b0;
                  i <= i + 32'd1;
                  end
						
            rddata_3:
                if(i==3)
                  begin
                  ad_rd <= 1'd1;
                  i <= 32'd0;
                  ad_data_3 <= ad_data_in;
                  state <= rddata_4;
                  end
                else
                  begin
                  ad_rd <= 1'b0;
                  i <= i + 32'd1;
                  end
						
            rddata_4:
                if(i==3)
                  begin
                  ad_rd <= 1'd1;
                  i <= 32'd0;
                  ad_data_4 <= ad_data_in;
                  state <= rddata_5;
                  end
                else
                  begin
                  ad_rd <= 1'b0;
                  i <= i + 32'd1;
                  end
						
            rddata_5:
                if(i==3)
                  begin
                  ad_rd <= 1'd1;
                  i <= 32'd0;
                  ad_data_5 <= ad_data_in;
                  state <= rddata_6;
                  end
                else
                  begin
                  ad_rd <= 1'b0;
                  i <= i + 32'd1;
                  end
						
            rddata_6:
                if(i==3)
                  begin
                  ad_rd <= 1'd1;
                  i <= 32'd0;
                  ad_data_6 <= ad_data_in;
                  state <= rddata_7;
                  end
                else
                  begin
                  ad_rd <= 1'b0;
                  i <= i + 32'd1;
                  end
						
            rddata_7:
                if(i==3)
                  begin
                  ad_rd <= 1'd1;
                  i <= 32'd0;
                  ad_data_7 <= ad_data_in;
                  state <= rddata_8;
                  end
                else
                  begin
                  ad_rd <= 1'b0;
                  i <= i + 21'd1;
                  end
						
            rddata_8:
                if(i==3)
                  begin
                  ad_rd <= 1'd1;
                  i <= 32'd0;
                  ad_data_8 <= ad_data_in;
                  state <= done;
                  end
                else
                  begin
                  ad_rd <= 1'b0;
                  i <= i + 32'd1;
                  end
				
				done:
				    begin
					   ad_cs <= 1'd1;
						ad_rd <= 1'b1;
						state <= wait_freq;
					 end
				
				wait_freq:
				    begin
					   if(i == 32'd781250)
						  begin
						    i <= 32'b0;
							 state <= start;
						  end
						else
						  i <= i + 32'b1;
					 end
				default state <= start;
         endcase
       end
end		 
            						
endmodule
