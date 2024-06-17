module Seq_Moore(
    input x,rst,clk,
    output reg count
);
parameter A = 3'b000,
          B = 3'b001,
          C = 3'b010,
          D = 3'b011,
          E = 3'b100;
    reg [2:0] cs,ns;
    always@(posedge clk or negedge rst)begin
        if(~rst)begin
        cs<=A;
        count<=0;
        end
        else
        cs<=ns;
    end
    always@(*)begin
        case (cs)
        A : begin
            if(x==0)
            ns=A;
            else
            ns=B;
            count=0;
        end
        B : begin
            if(x==0)
            ns=A;
            else
            ns=C;
            count=0;
        end
        C : begin
            if(x==0)
            ns=D;
            else
            ns=B;
            count=0;
        end
        D : begin
            if(x==0)
            ns=A;
            else
            ns=E;
            count=0;
        end
        E : begin
            if(x==0)
            ns=A;
            else
            ns=B;
            count=1;
        end
            endcase
    end

    endmodule