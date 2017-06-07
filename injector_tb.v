module injector_tb();

reg [9:0] northad;
reg [9:0] southad;
reg [9:0] westad;
reg [9:0] eastad;         //0 is from east, 1 from west, 2 from north, 3 from south 
reg [9:0] localad;
reg clk;
wire [9:0] nad;           //0 is to east, 1 to west, 2 to north, 3 to south 
wire [9:0] sad;
wire [9:0] ead;
wire [9:0] wad;

always begin              //Clock generator
#1 clk=~clk;
end

initial begin
   clk=0;
   northad = 10'bz;
   southad = 10'b0000000101;
   eastad  = 10'b1000100001;
   westad  = 10'b0000100111;
   localad = 10'b0000111111;
  
   //$display("Time\t address Direction");
   //$monitor("%g  \t %b      %b",$time, addr, direct);
#2  northad = 10'b1000100101; //l
    southad = 10'bz;   	      //e
    eastad  = 10'b0000101100; //n
    westad  = 10'b0000011100; //w
    localad = 10'b0000100000;
   
#2  northad = 10'b0000100110; //e
    southad = 10'b0000000001; //w
    eastad  = 10'bz;          //l
    westad  = 10'b0000010001; //w
    localad = 10'b0000101100; 	
   
#2  northad = 10'b0000111100; //n
    southad = 10'b0000000011; //w
    eastad  = 10'b0000001100; //s
    westad  = 10'b0000010101; //e
    localad = 10'b0000001100;
 
#2  northad = 10'b0000001000; //w
    southad = 10'b0000110100; //n
    eastad  = 10'bz;          //e
    westad  = 10'b0000100111; //l
    localad = 10'b0000000000;	
#5 $finish;
end

injector U0 (   //Connect DUT to test bench
 northad,
 southad,
 westad,
 eastad,        //0 is from east, 1 from west, 2 from north, 3 from south 
 localad,
 clk,
 nad,           //0 is to east, 1 to west, 2 to north, 3 to south 
 sad,
 ead,
 wad,
);

endmodule