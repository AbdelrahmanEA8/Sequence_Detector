module RAM_assign_TB();
    reg [7:0] add_a,add_b;
    reg [7:0] din_a,din_b;
    reg clk_a,clk_b,we_a,we_b,rst;
    wire [7:0] dout_a,dout_b;
integer i,j;
RAM_assign DUT (.add_a(add_a),.add_b(add_b),.din_a(din_a),.din_b(din_b),.clk_a(clk_a),
                .clk_b(clk_b),.we_a(we_a),.we_b(we_b),.rst(rst),.dout_a(dout_a),.dout_b(dout_b));
always #10 clk_a= ~clk_a;
always #10 clk_b= ~clk_b;
initial begin
    clk_a=0;rst=0;din_a=0;add_a=0;we_a=0;clk_b=0;rst=0;din_b=0;add_b=0;we_b=0;
    #20 rst=1;
end
initial begin
    for (i =0 ;i<8 ;i=i+1) begin  // Port A Write
    @(negedge clk_a);
    add_a=i;
    din_a=i*3;
    we_a=1;
     add_b=i;
    din_b=i*5;
    we_b=1;
    @(negedge clk_a);
    we_a=0;
    we_b=0;
    end
    #20 $stop;
end
endmodule