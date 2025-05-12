// Code your design here
module sram(input clk,wr,rst,input [3:0]din,input [3:0]addr,output reg [3:0]dout);
parameter addr1=16,data1=4;
reg [data1-1:0]mem[0:addr1-1]; 
always @(posedge clk)
begin 
if(!rst)
dout<=4'b0;
else
if(wr)
mem[addr]<=din;
else 
dout<=mem[addr];
end
endmodule


