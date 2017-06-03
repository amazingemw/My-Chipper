module twoarb(
inp1,
inp2,
clk,
out1,
out2
);

input [9:0] inp1;
input [9:0] inp2;
input clk;
output [9:0] out1;
output [9:0] out2;

wire [9:0] inp1;
wire [9:0] inp2;
wire clk;
reg [9:0] out1;
reg [9:0] out2;

always @ (posedge clk) begin
	if ( inp1[9] == 1'b1 ) begin
		if (inp1[8:6] == 3'b000 || inp1[8:6] == 3'b001) begin 
			out1[9:0] = inp2[9:0];
		        out2[9:0] = inp1[9:0];
		end else begin 
		        out1[9:0] = inp1[9:0];
			out2[9:0] = inp2[9:0];
	        end      
	end else if ( inp2[9] == 1'b1 ) begin 
	        if (inp2[8:6] == 3'b000 || inp2[8:6] == 3'b001) begin 
			out1[9:0] = inp1[9:0];
		        out2[9:0] = inp2[9:0];
	        end else begin 
	           	out1[9:0] = inp2[9:0];
	         	out2[9:0] = inp1[9:0];
	        end
	end else if (inp1[8:6] == 3'b000 || inp1[8:6] == 3'b001 ) begin 
               		out1[9:0] = inp2[9:0];
		 	out2[9:0] = inp1[9:0];
    	end else begin 
	         	out1[9:0] = inp1[9:0];
	         	out2[9:0] = inp2[9:0];
	end
end
endmodule
