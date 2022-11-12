
module AHB_slave (HCLK,HADDR,HWRITE,HRDATA,HREADY );

  input logic HCLK;
  //TO SLAVE
  input reg [3:0] HADDR  ;
  input reg [31:0] HRDATA;
  input reg HWRITE;
  //FROM SLAVE
  output reg HREADY;

  logic [31:0] ROM [0:9] = '{default:0};

  initial 
  begin
    HREADY <=  1'bz ;
  end

  always @(posedge HCLK)
  
  begin 
  
  if (HWRITE == 1'b1)
    begin
    ROM [HADDR] <= HRDATA;
    end
  else if (HWRITE == 1'b0 )
    begin
    HREADY <= 1'b0;
    end
  else
    begin
    HREADY <= 1'b0;
    end
  end 
  

endmodule 

