module ejector (
northad,
southad,
eastad,
westad,
clk,
nad,
sad,
ead,
wad,
lad
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
output [9:0] lad;

wire [9:0] northad;  
wire [9:0] southad; 
wire [9:0] eastad; 
wire [9:0] westad;
wire clk;
reg [9:0] nad;
reg [9:0] sad;
reg [9:0] ead;
reg [9:0] wad;
reg [9:0] lad;


always @(northad)
begin
 ejectout(northad, nad[5:0], nad[8:6],nad[9], lad);     //function to fill a blank channel
 ejectout(southad, sad[5:0], sad[8:6],sad[9], lad);     //with a local channel
 ejectout(eastad, ead[5:0], ead[8:6],ead[9], lad);
 ejectout(westad, wad[5:0], wad[8:6],wad[9], lad);
end


reg [2:0] col;                //global variables for task directandfill
reg [2:0] row;

task ejectout;
	
	input [9:0] addr;
	output [5:0] adr;
	output [2:0] dir;
        output gbo;
	output [9:0] local;

	begin   
		{gbo,dir,adr} = addr;
		row = addr[5:3];  
		col = addr[2:0]; 
        	if ( col > 3'b100) begin
			dir = 3'b000;             	//EAST
       		end
       		if ( col < 3'b100) begin
			dir = 3'b001;             	//WEST
       		end 
		if ( col === 3'b100) begin
			if ( row > 3'b100) begin
				dir = 3'b010;           //NORTH
       			end
			if ( row < 3'b100) begin
				dir = 3'b011;           //SOUTH
      			end
			if ( row === 3'b100) begin
				local = addr;
				{gbo,dir,adr} = 10'bz;
			end
       		end
	end  //begin's end
endtask
endmodule
