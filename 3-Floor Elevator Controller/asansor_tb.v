`timescale 1ns / 1ps

module asansor_tb();

reg    i_clk     ;
reg    i_rst        ;
reg    [1:0]btn  ;
wire   [1:0]led  ;

asansor uut(

.i_clk  (i_clk),
.i_rst  (i_rst),
.btn    (btn  ),
.led    (led  )

);


initial begin

i_clk = 0 ;
forever   #5 i_clk = ~i_clk;

end

initial begin
    #1000;
    i_rst = 1;
    #10;
    i_rst = 0;
    #10;

 repeat(10)begin
   
   btn = $random %4;
   #10;

end

end

endmodule
