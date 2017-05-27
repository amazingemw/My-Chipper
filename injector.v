module injector (
addr,
localadd,
clk,
adr,
localdir
);

input [23:0] addr;
input [5:0] localadd;
input clk;
output [23:0] adr;
output [4:0] localdir;

wire [5:0] addr [0:3];     //0 is from east, 1 from west, 2 from north, 3 from south 
wire [5:0] localadd;
reg [5:0] adr [0:3];       //0 is to east, 1 to west, 2 to north, 3 to south 
reg [4:0] localdir;

reg [2:0] xax;
reg [2:0] yax;

always @(posedge clk)
begin
	for (i=0;i<4;i+1) begin
		if (addr[i] === 5'bz) begin
			adr[i] = localadd;
			yax = localadd[5:3];  //Destination x coordinate
			xax = localadd[2:0];  //Destination y coordinate
			if ( xax > 3'b100) begin
				localdir = 5'b00001;             //EAST
        		end
        		if ( xax < 3'b100) begin
				localdir = 5'b00010;             //WEST
        		end 
			if ( xax === 3'b100) begin
				if ( yax > 3'b100) begin
					localdir = 5'b00100;             //NORTH
        			end
				if ( yax < 3'b100) begin
					localdir = 5'b01000;             //SOUTH
        			end
				if ( yax === 3'b100) begin
					localdir = 5'b10000;             //LOCAL            
        			end
        		end
		
		end else begin
			adr[i] = addr[i];
		end
	end
end

		
		
			