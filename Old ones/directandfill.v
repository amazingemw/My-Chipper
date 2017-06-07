module directandfill();

task directandfill;
	input [5:0] addr;
	input [5:0] localad;
	output [5:0] adr;
	output [2:0] dir;

	reg [2:0] col;
	reg [2:0] row;

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