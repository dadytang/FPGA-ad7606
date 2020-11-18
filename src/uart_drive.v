`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:52:42 05/31/2020 
// Design Name: 
// Module Name:    uart_tx_test 
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
module uart_drive
     #(parameter  CLK_FRE = 50,
       parameter  BAUD_RATE = 115200)
    (
	 input clk,
	 input rst_n,
	 input[19:0] dec,
	 input[7:0] sign,
	 input uart_we,
	 
	 output tx_reg,
	 output reg uart_end
    );	 

wire uart_tx_end;
reg  uart_tx_we;
reg[7:0]  data_tx;
reg[7:0]  data[4:0];
reg[3:0]  i;

always@(posedge clk or negedge rst_n)
begin
       if(!rst_n)
		 begin
		 i <= 4'b0;
		 uart_end <= 1'b0;
		 end
		 else if(uart_we)
		 begin
		        case(i)
				  
				  0:
				  if(uart_tx_end)
				  begin
				         uart_tx_we <= 1'b0;
							i <= i+1;
				  end
				  else
				  begin
				         uart_tx_we <= 1'b1;
							data_tx <= sign;
				  end
				  
				  1:
				  if(uart_tx_end)
				  begin
				         uart_tx_we <= 1'b0;
							i <= i+1;
				  end
				  else
				  begin
				         uart_tx_we <= 1'b1;
							data_tx <= dec[19:16] + 48;
				  end
				  
				  2:
				  if(uart_tx_end)
				  begin
				         uart_tx_we <= 1'b0;
							i <= i+1;
				  end
				  else
				  begin
				         uart_tx_we <= 1'b1;
							data_tx <= 46; // .
				  end
				  
				  3:
				  if(uart_tx_end)
				  begin
				         uart_tx_we <= 1'b0;
							i <= i+1;
				  end
				  else
				  begin
				         uart_tx_we <= 1'b1;
							data_tx <= dec[15:12] + 48;
				  end
				  
				  4:
				  if(uart_tx_end)
				  begin
				         uart_tx_we <= 1'b0;
							i <= i+1;
				  end
				  else
				  begin
				         uart_tx_we <= 1'b1;
							data_tx <= dec[11:8] + 48;
				  end
				  
				  5:
				  if(uart_tx_end)
				  begin
				         uart_tx_we <= 1'b0;
							i <= i+1;
				  end
				  else
				  begin
				         uart_tx_we <= 1'b1;
							data_tx <= dec[7:4] + 48;
				  end
				  
				  6:
				  if(uart_tx_end)
				  begin
				         uart_tx_we <= 1'b0;
							i <= i+1;
				  end
				  else
				  begin
				         uart_tx_we <= 1'b1;
							data_tx <= dec[3:0] + 48;
				  end
				  
				  7:
				  if(uart_tx_end)
				  begin
				         uart_tx_we <= 1'b0;
							i <= i+1;
				  end
				  else
				  begin
				         uart_tx_we <= 1'b1;
							data_tx <= 86; // V
				  end
				  
				  8:
				  if(!uart_end)
				  begin
				         uart_end <= 1'b1;
				  end
				  else
				  begin
				         uart_end <= 1'b0;
							i <= 0;
				  end
				  
		        endcase				  
		 end
end

uart_tx uart_tx (
    .clk(clk), 
    .rst_n(rst_n), 
    .uart_tx_we(uart_tx_we), 
    .data_tx(data_tx), 
    .tx_reg(tx_reg), 
    .uart_tx_end(uart_tx_end)
    );

endmodule
