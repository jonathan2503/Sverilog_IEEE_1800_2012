timeunit 1ns;
timeprecision 1ns;

`include "AHB_master.sv"
`include "AHB_slave.sv"

module AHB_BUS(T_HCLK,T_WRITE,T_ADDR,T_DATA,T_READY);
input  logic T_HCLK ; 

input  reg T_WRITE;
input  reg [3:0] T_ADDR;
input  reg [31:0]T_DATA;
output reg T_READY;

wire [3:0] S_HADDR ;
wire [31:0] S_HDATA ;
wire  S_HWRITE;
wire  S_HREADY ;

AHB_master via(
 .HCLK(T_HCLK),
 .ADDR(T_ADDR),.DATA(T_DATA),.WRITE(T_WRITE),.READY(T_READY),

 .HADDR(S_HADDR),.HWRITE(S_HWRITE),.HRDATA(S_HDATA),.HREADY(S_HREADY)
 );

AHB_slave cu (
   .HCLK(T_HCLK),
   .HADDR(S_HADDR),.HWRITE(S_HWRITE),.HRDATA(S_HDATA),.HREADY(S_HREADY) );


endmodule


