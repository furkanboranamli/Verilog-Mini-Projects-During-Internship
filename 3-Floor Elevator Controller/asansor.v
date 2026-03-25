`timescale 1ns / 1ps

module asansor(

//INPUTS:
input wire i_clk,
input wire i_rst,
input wire [1:0] btn,
// OUTPUTS:
output reg [1:0]led   

    );
    
 reg [1:0]STATE;
 
 localparam KAT0 = 2'd0 ,     
            KAT1 = 2'd1 ,   
            KAT2 = 2'd2 ;   
 
 localparam KIRMIZI =   2'd0, 
            YESIL   =   2'd1,
            MAVI    =   2'd2;
            
            
always @(posedge i_clk or posedge i_rst) begin

if(i_rst) begin
   led <= 0;
   STATE <= 0;
end

else begin
  case(STATE) 
  
  KAT0:begin
  
    if(btn == 2'b00)begin      
       STATE <= KAT0;   
     end
     
     else if (btn == 2'b01)begin
       STATE <= KAT1;
     end
     
     else if (btn == 2'b10)begin
       STATE <= KAT2;
     end
  end
  
  KAT1:begin
  
  if( btn == 2'b00) begin  
  STATE <= KAT0;
   end
  
  else if(btn == 2'b01)begin  
  STATE <= KAT1; 
  end
  
  else if(btn == 2'b10)begin 
  STATE <= KAT2; 
  end
  
  end
  
  
  KAT2:begin
 
  if ( btn == 2'b00) begin  
  STATE <= KAT0;  
  end
  
  else if( btn == 2'b01) begin
  STATE <= KAT1; 
  end
  
  else if( btn == 2'b10) begin
 
  STATE <= KAT2;
  
  end
  end
  
  default: begin
   
 if(btn == 2'b00)begin      
       STATE <= KAT0;   
     end
     
     else if (btn == 2'b01)begin
       STATE <= KAT1;
     end
     
     else if (btn == 2'b10)begin
       STATE <= KAT2;
     end

  end
  endcase 



end            
end    

always @(*)begin

case(STATE)

KAT0 : led = KIRMIZI;
KAT1 : led = YESIL;
KAT2 : led = MAVI;
default : led = KAT0;
endcase



end
       
endmodule
