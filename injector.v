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


initial begin
nad [8:6] = 3'b111; 
sad [8:6] = 3'b111; 
ead [8:6] = 3'b111; 
wad [8:6] = 3'b111;           
end

always @ (northad,southad,westad,eastad) begin
nad  = northad ;   //encoding the destination address, direction bits and golden bit
sad  = southad ;   //to o/p channel
ead  = eastad ;
wad  = westad ;      
end       
                                      
always @(posedge clk)
begin
 directandfill(northad[5:0], localad, nad[5:0], nad[8:6]);     //function to fill a blank channel
 directandfill(southad[5:0], localad, sad[5:0], sad[8:6]);     //with a local channel
 directandfill( eastad[5:0], localad, ead[5:0], ead[8:6]);
 directandfill( westad[5:0], localad, wad[5:0], wad[8:6]);
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


