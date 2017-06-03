module ejector (
northad,
southad,
eastad,
westad,
localad,
clk,
nad,
sad,
ead,
wad,
);

input [9:0] northad;  
input [9:0] southad; 
input [9:0] eastad; 
input [9:0] westad;
input clk;
output [9:0] nad;
output [9:0] sad;
output [9:0] ead;
output [9:0] wad;


wire clk;
reg [4:0] direct;

reg [2:0] xax;
reg [2:0] yax;

initial begin
xax = addr[5:3]; //Destination x coordinate
yax = addr[2:0]; //Destination y coordinate
#3 $display("addr=%b xaxis=%b yaxis=%b direct=%b", addr, xax, yax, direct);
end


reg [2:0] col;                //global variables for task directandfill
reg [2:0] row;

task directandfill;
	input [5:0] addr;
	input [5:0] localad;
	output [5:0] adr;
	output [2:0] dir;

	begin 
	
        	if (addr === 6'bz) begin
			adr = localad;
	 		row = localad[5:3];  
			col = localad[2:0]; 	
		end else begin
			adr = addr;
			row = addr[5:3];  
			col = addr[2:0]; 
		end
	
        	if ( col > 3'b100) begin
			dir = 3'b000;             	//EAST
       		end
       		if ( col < 3'b100) begin
			dir = 5'b001;             	//WEST
       		end 
		if ( col === 3'b100) begin
			if ( row > 3'b100) begin
				dir = 5'b010;           //NORTH
       			end
			if ( row < 3'b100) begin
				dir = 5'b011;           //SOUTH
      			end
			if ( row === 3'b100) begin
				dir = 5'b100; 	        //LOCAL    
			end
       		end
	
	end  //begin's end
endtask

endmodule
