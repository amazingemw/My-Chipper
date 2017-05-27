module directandfill();
reg [2:0] col;
reg [2:0] row;

task direction;
	input [5:0] addr;
	input [5:0] localad;
	output [5:0] adr;
	output [4:0] dir;
	output flag;

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