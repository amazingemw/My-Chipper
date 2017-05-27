module injector_tb();

reg [5:0] northad;
reg [5:0] southad;
reg [5:0] westad;
reg [5:0] eastad;       //0 is from east, 1 from west, 2 from north, 3 from south 
reg [5:0] localadd;
reg clk;
reg flagvalue;
wire [5:0] nad;           //0 is to east, 1 to west, 2 to north, 3 to south 
wire [5:0] sad;
wire [5:0] ead;
wire [5:0] wad;
wire [4:0] localndir;
wire [4:0] localsdir;
wire [4:0] localedir;
wire [4:0] localwdir;

always begin              //Clock generator
#2 clk=~clk;
end

initial begin
   clk=0;
   northad = 6'b101101;
   southad = 6'b000101;
   eastad  = 6'b100001;
   westad  = 6'b100111;
   localadd = 6'b111111;
   //$display("Time\t address Direction");
   //$monitor("%g  \t %b      %b",$time, addr, direct);
#10 northad = 6'b100100; //l
    southad = 6'b101111; //e
    eastad  = 6'b101100; //n
    westad  = 6'b011001; //w
    flagvalue = 0;
#10 northad = 6'b100110; //e
    southad = 6'b000001; //w
    eastad  = 6'b100100; //l
    westad  = 6'b010001; //w
    flagvalue = 0;
#10 northad = 6'b111100; //n
    southad = 6'b000011; //w
    eastad  = 6'b001100; //s
    westad  = 6'b010101; //e
    flagvalue = 0;
#10 northad = 6'b000000; //w
    southad = 6'b110100; //n
    eastad  = 6'b100111; //e
    westad  = 6'b100100; //l
   #15 $finish;
end

injector U0 (              //Connect DUT to test bench
 northad,
 southad,
 westad,
 eastad,        //0 is from east, 1 from west, 2 from north, 3 from south 
 localadd,
 clk,
 nad,           //0 is to east, 1 to west, 2 to north, 3 to south 
 sad,
 ead,
 wad,
 localndir,
 localsdir,
 localedir,
 localwdir,
 flagvalue
);

endmodule