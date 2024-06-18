module RAM_assign(
    input [7:0] add_a,add_b,
    input [7:0] din_a,din_b,
    input clk_a,clk_b,we_a,we_b,rst,
    output reg [7:0] dout_a,dout_b
);
integer i;
parameter width = 8,
          depth = 8;
          reg [width-1:0] MEM [0:2**depth-1];
          always @(*)begin
            if(~rst)begin
                for (i =0 ;i<width;i=i+1 ) begin
                    MEM[i]<=8'b0;
                end
            end
          end
          always @(posedge clk_a) begin
            if(we_a)
            MEM[add_a]<=din_a;
            else
            dout_a <= MEM[add_a];
          end
          always @(posedge clk_b) begin
                if(we_b)
                MEM[add_b]<=din_b;
                else
                dout_b<=MEM[add_b];
          end
    endmodule

module RAM_assign_TB();
    reg [7:0] add_a,add_b;
    reg [7:0] din_a,din_b;
    reg clk_a,clk_b,we_a,we_b,rst;
    wire [7:0] dout_a,dout_b;
integer i;
RAM_assign DUT (.add_a(add_a),.add_b(add_b),.din_a(din_a),.din_b(din_b),.clk_a(clk_a),
                .clk_b(clk_b),.we_a(we_a),.we_b(we_b),.rst(rst),.dout_a(dout_a),.dout_b(dout_b));
always #10 clk_a= ~clk_a;
always #10 clk_b= ~clk_b;
initial begin
    clk_a=0;clk_b=0;rst=0;din_a=0;din_b=0;add_a=0;add_b=0;
    #20 rst=1;we_a=1; add_a=0; din_a=5; we_b=1; add_b=0; din_a=8;
    #20 we_a=0; add_a=0;we_b=0; add_b=0;
    #20 rst=1;we_a=1; add_a=0; din_a=15; we_b=1; add_b=0; din_a=12;
    #20 we_a=0; add_a=0;we_b=0; add_b=0;
    #20 $stop;

end
  
endmodule
