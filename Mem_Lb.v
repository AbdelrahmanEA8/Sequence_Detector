module Ram_Lab(
    input [width-1:0] wr_data,
    input [width-1:0] wr_add,rd_add,
    input rd_en,wr_en,rst,clk,
    output reg [width-1:0] rd_data
);
integer i;
parameter width = 16,
          depth = 4;
reg [width-1:0] MEM [0:2**depth-1];
always @(posedge clk or negedge rst) begin
    if(~rst)begin
      for (i =0 ;i<depth ;i=i+1 ) begin
        MEM[i]<=0;
      end
    end
    else if(rd_en)begin
        rd_data<=MEM[rd_add];
    end
    else if(wr_en)begin
        MEM[wr_add]<=wr_data;
    end
end
endmodule