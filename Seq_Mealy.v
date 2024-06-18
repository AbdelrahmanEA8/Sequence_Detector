module Seq_mealy(
    input x,clk,rst,
    output reg count
);
parameter A =2'b00,
          B =2'b01,
          C =2'b10,
          D =2'b11;
reg [1:0] ns, cs;
always@(negedge rst or posedge clk)begin
    if(~rst)begin
        ns<=A;
        count<=0;
    end
    else
    ns<=cs;

end
always@(negedge rst or posedge clk)begin
    case (cs)
       A : begin
            if(x==0)begin
                ns=A;
                count=0;
            end
            else begin
                ns=B;
                count=0;
            end
       end
       B : begin
         if(x==0)begin
                ns=A;
                count=0;
            end
            else begin
                ns=C;
                count=0;
            end
       end
       C : begin
         if(x==0)begin
                ns=D;
                count=0;
            end
            else begin
                ns=B;
                count=0;
            end
       end
       D : begin
         if(x==0)begin
                ns=A;
                count=0;
            end
            else begin
                ns=A;
                count=1;
            end
       end 
    endcase

end
    endmodule
    module Seq_mealy_TB();
    reg x,clk,rst;
    wire count;
    integer i;
    Seq_mealy DUT (.x(x),.clk(clk),.rst(rst),.count(count));
    always #10 clk =~clk;
    initial begin
        clk=0; rst=0; i=0;
        #20
        rst=1; x=1; #20 x=1; #20 x=0; #20 x=1;
        #20
        for(i=0;i<20;i=i+1)begin
            @(negedge clk);
            x=$random;
        end
    end
    endmodule