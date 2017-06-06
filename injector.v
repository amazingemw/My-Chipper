module injector (
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
input [9:0] localad;
input clk;
output [9:0] nad;
output [9:0] sad;
output [9:0] ead;
output [9:0] wad;

wire [9:0] northad;
wire [9:0] southad;
wire [9:0] westad;
wire [9:0] eastad;           //0 is from east, 1 from west, 2 from north, 3 from south 
wire [9:0] localad;
wire clk;
reg [9:0] nad;               //0 is to east, 1 to west, 2 to north, 3 to south 
reg [9:0] sad;
reg [9:0] ead;
reg [9:0] wad;


always @ (northad,southad,westad,eastad) begin
nad  = northad ;   //encoding the destination address, direction bits and golden bit
sad  = southad ;   //to o/p channel
ead  = eastad ;
wad  = westad ;      
end       
                                      
always @(posedge clk)
begin
 directandfill(northad, localad, nad, nad[8:6]);     //function to fill a blank channel
 directandfill(southad, localad, sad, sad[8:6]);     //with a local channel
 directandfill( eastad, localad, ead, ead[8:6]);
 directandfill( westad, localad, wad, wad[8:6]);
end


reg [2:0] col;                //global variables for task directandfill
reg [2:0] row;

task directandfill;
	input [9:0] addr;
	input [9:0] localad;
	output [9:0] adr;
	output [2:0] dir;

	begin 
	
        	if (addr[5:0] === 6'bz) begin
			adr = localad;
	 		row = localad[5:3];  
			col = localad[2:0]; 
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
					dir = 3'b100; 	        //LOCAL    
				end
	       		end
		end else begin
			adr = addr;
			dir = addr[8:6];
		end
	end  //begin's end
endtask


endmodule


