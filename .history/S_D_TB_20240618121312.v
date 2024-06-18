 module Seq_Moore_TB();
    reg x,clk,rst;
    wire count;
    integer i;
    Seq_Moore DUT (.clk(clk),.x(x),.rst(rst),.count(count));
    always #10 clk= ~clk;
    initial begin
        clk=0; rst=0; x=0; i=0;
        #20 rst=1;
        #20 x=1; #20 x=1; #20 x=0; #20 x=1; //Hand_TB
        #10
    for(i=0;i<20;i=i+1)begin
         @(negedge clk);
          x=$random;
    end
    end
    endmodule