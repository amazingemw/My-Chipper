module ejector_tb();

reg [9:0] northad;  
reg [9:0] southad; 
reg [9:0] eastad; 
reg [9:0] westad;
wire [9:0] nad;
wire [9:0] sad;
wire [9:0] ead;
wire [9:0] wad;
wire [9:0] lad;


initial begin
    northad = 10'bz;
    southad = 10'b0000000101;
    eastad  = 10'b1000100001;
    westad  = 10'b0000100100;

#2  northad = 10'b1000100100; //l
    southad = 10'b0000111111; //e
    eastad  = 10'b0000101100; //n
    westad  = 10'b0000011100; //w

#2  northad = 10'b0000100110; //e
    southad = 10'b0000000001; //w
    eastad  = 10'b1000101100; //l
    westad  = 10'b0000100100; //w

#2  northad = 10'b0000111100; //n
    southad = 10'b0000000011; //w
    eastad  = 10'b0000100100; //s
    westad  = 10'b0000010101; //e

#2  northad = 10'b0000100100; //w
    southad = 10'b0000110100; //n
    eastad  = 10'bz; //e
    westad  = 10'b0000100111; //l

#2 $finish;
end


ejector U0 (
northad,
southad,
eastad,
westad,
nad,
sad,
ead,
wad,
lad
);


endmodule
