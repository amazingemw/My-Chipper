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
localndir,
localsdir,
localedir,
localwdir
);

input [5:0] northad;
input [5:0] southad;
input [5:0] eastad;
input [5:0] westad;
input [5:0] localad;
input clk;
output [5:0] nad;
output [5:0] sad;
output [5:0] ead;
output [5:0] wad;
output [4:0] localndir;
output [4:0] localsdir;
output [4:0] localedir;
output [4:0] localwdir;

wire [5:0] northad;
wire [5:0] southad;
wire [5:0] westad;
wire [5:0] eastad;       //0 is from east, 1 from west, 2 from north, 3 from south 
wire [5:0] localadd;
wire clk;
reg [5:0] nad;           //0 is to east, 1 to west, 2 to north, 3 to south 
reg [5:0] sad;
reg [5:0] ead;
reg [5:0] wad;
reg [4:0] localndir;
reg [4:0] localsdir;
reg [4:0] localedir;
reg [4:0] localwdir;

reg [2:0] col;
reg [2:0] row;
reg flag = 0;

always @(posedge clk)
begin
 direction(northad, localad, nad,localndir);
 if (flag === 0) 
 direction(southad, localad, sad,localsdir);
 if (flag === 0)
 direction(eastad, localad, ead,localedir);
 if (flag === 0)
 direction(westad, localad, wad,localwdir);
end


task direction;
	input [5:0] addr;
	input [5:0] localad;
	output [5:0] adr;
	output [4:0] dir;

	begin
	row = addr[5:3];  //Destination x coordinate
	col = addr[2:0];  //Destination y coordinate
	if (addr === 6'bz) begin
		adr = localad;	
		if ( col > 3'b100) begin
			dir = 5'b00001;             	 //EAST
        	end
        	if ( col < 3'b100) begin
			dir = 5'b00010;             	 //WEST
        	end 
		if ( col === 3'b100) begin
			if ( row > 3'b100) begin
				dir = 5'b00100;             //NORTH
        		end
			if ( row < 3'b100) begin
				dir = 5'b01000;             //SOUTH
        		end
			if ( row === 3'b100) begin
				dir = 5'b10000; 	    //LOCAL    
				flag = 1;        
        		end
        	end
	end else begin
		adr = addr;
	end
	end
endtask

endmodule

		
		
			