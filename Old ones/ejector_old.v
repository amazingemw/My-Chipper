module ejector (
addr,		//Destination address
direct,	        //Output direction
clk             //Clock input
);

input [5:0] addr;  
input clk;
output [4:0] direct;

wire clk;
reg [4:0] direct;

reg [2:0] xax;
reg [2:0] yax;

initial begin
xax = addr[5:3]; //Destination x coordinate
yax = addr[2:0]; //Destination y coordinate
#3 $display("addr=%b xaxis=%b yaxis=%b direct=%b", addr, xax, yax, direct);
end

always @(posedge clk)
begin   
	yax = addr[5:3];  //Destination x coordinate
	xax = addr[2:0];  //Destination y coordinate
	if ( xax > 3'b100) begin
		direct = 5'b00001;             //EAST
        end
        if ( xax < 3'b100) begin
		direct = 5'b00010;             //WEST
        end 
	if ( xax === 3'b100) begin
		if ( yax > 3'b100) begin
		direct = 5'b00100;             //NORTH
        	end
		if ( yax < 3'b100) begin
		direct = 5'b01000;             //SOUTH
        	end
		if ( yax === 3'b100) begin
		direct = 5'b10000;             //LOCAL            
        	end
        end
end

endmodule


