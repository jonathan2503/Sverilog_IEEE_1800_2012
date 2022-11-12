
module AHB_master (HCLK,HADDR,HWRITE,HRDATA,HREADY,ADDR,DATA,WRITE,READY );


  input logic HCLK;

  //TO SLAVE
  output reg [3:0] HADDR  ;
  output reg [31:0] HRDATA;
  output reg HWRITE;
  //FROM SLAVE
  input reg HREADY;

  //TESTBENCH
  input reg [3:0] ADDR  ;
  input reg [31:0] DATA;
  input reg WRITE;
  output reg READY;

  initial 
  begin
    HADDR  <= 4'bz ;
    HRDATA <= 32'bz ;
    HWRITE <= 1'bz ;
    READY <=  1'bz ;
  end

  always @(posedge HCLK)
  
  begin 
    HADDR  <= ADDR ;
    HRDATA <= DATA ;
    HWRITE <= WRITE ;
    READY  <= HREADY; 
  end

endmodule 

