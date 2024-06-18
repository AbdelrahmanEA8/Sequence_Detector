module Sequence_Detector (
    input x,clk,rst,
    output reg [2:0] count
);
// part of Abdelrahman Essam
reg [1:0] cs,ns;
parameter A = 2'b00,
          B = 2'b01,
          C = 2'b10,
          D = 2'b11;
always @(posedge clk or negedge rst) begin
    if(~rst)
    cs<=A;
    else
    cs<=ns;
end
always@(*)begin
    case (cs)
      A  : begin 
            if(x==0)
            ns = B;
            else
            ns = A;
            count=0;
      end
      B  : begin
            if(x==0)
            ns = B;
            else
            ns = C;
            count=1;
      end
      C  : begin
            if(x==0)
            ns = B;
            else
            ns = D;
            count=3'b011;
      end
      D  : begin 
            if(x==0)
            ns = B;
            else
            ns = A;
            count=3'b111;
      end
    endcase
end


endmodule