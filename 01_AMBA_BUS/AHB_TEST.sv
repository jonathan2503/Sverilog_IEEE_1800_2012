timeunit 1ns;
timeprecision 1ns;

`include "AHB_master.sv"

module tb();

   logic CLK;
   reg WRITE;
   reg [31:0] HRDATA;
   reg [3:0] ADDR  ;
   reg [31:0] DATA;
   reg READY;
   localparam CLK_PERIOD = 10;

   //UNDER TEST
   AHB_BUS dut(.T_HCLK(CLK),.T_WRITE(WRITE),
      .T_ADDR(ADDR),.T_DATA(DATA),
      .T_READY(READY));

   initial begin
      CLK = 1'b0;
   end

   always #(CLK_PERIOD / 2) 
   begin
      CLK = ~CLK;
   end

   initial
   begin 
     # 10 
     ADDR   = 4'D5 ;
     DATA   = 31'D30 ;
     WRITE  = 1'b1;
     # 10 
     ADDR   = 4'D8 ;
     DATA   = 32'D500 ;
     WRITE  = 1'b1;
      # 10 
     ADDR   = 4'D8 ;
     DATA   = 32'D0 ;
     WRITE  = 1'b0;
   end
endmodule


