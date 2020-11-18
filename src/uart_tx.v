`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:00:43 05/31/2020 
// Design Name: 
// Module Name:    uart_tx 
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
module uart_tx
     #(parameter  CLK_FRE = 50,
       parameter  BAUD_RATE = 115200)
(
        input  clk,
		  input  rst_n,
		  input  uart_tx_we,
		  input[7:0]  data_tx,
		  output reg  tx_reg,
		  output reg  uart_tx_end
);

localparam  CYCLE = CLK_FRE * 1000000 / BAUD_RATE;

reg[3:0]  data_bit;
reg[15:0]  i;

always@(posedge clk or negedge rst_n)
begin
       if(rst_n == 1'b0)
		 begin
		        tx_reg <= 1'b0;
				  uart_tx_end <= 1'b0;
				  data_bit <= 1'b0;
				  i <= 16'd0;
		 end
		 else if(uart_tx_we)
		 begin
		        case(data_bit)
				       

						 0:
						    if(i == CYCLE-1)
							 begin
							        data_bit <= data_bit+1;
									  i <= 16'd0;
							 end		  
							 else
							 begin
							        tx_reg <= 1'b0;
									  i <= i+1;
							 end
						  
						  
						  1,2,3,4,5,6,7,8:
							 if(i == CYCLE-1)
                      begin
                       		  data_bit <= data_bit+1;
									  i <= 16'd0;
							 end		  
							 else
							 begin
							        tx_reg <= data_tx[data_bit-1];
									  i <= i+1;
							 end

                    9,10:
							 if(i == CYCLE-1)
                      begin
                       		  data_bit <= data_bit+1;
									  i <= 16'd0;
							 end		  
							 else
							 begin
							        tx_reg <= 1'b1;
									  i <= i+1;
							 end
							 
                    11:
						     if(!uart_tx_end)
							  begin
							  uart_tx_end <= 1'b1;
							  end
							  else
                       begin
                       uart_tx_end <= 1'b0;
							  data_bit <= 4'b0;
                       end
              endcase
		 end
end
		 
endmodule
