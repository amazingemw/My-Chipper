module ejector_tbtest();

reg clk;
reg [5:0] addr;
wire [4:0] direct;

always begin              //Clock generator
#2 clk=~clk;
end

initial begin
   clk=0;
   assign addr = 6'b100101;
   $display("Time\t Address Direction");
   $monitor("%g  \t %b      %b",$time, addr, direct);
   #10 assign addr = 6'b100101;          //45  must be routed to east
   #10 assign addr = 6'b100001;           //41  must be routed to west
   #10 assign addr = 6'b110100;           //64  must be routed to north
   #10 assign addr = 6'b000100;           //04  must be routed to south
   #10 assign addr = 6'b100100;           //44  must be routed to local
   #15 $finish;
end


ejectortest U0 (              //Connect DUT to test bench
.addr (addr),
.direct (direct),
.clk (clk)
);


endmodule

