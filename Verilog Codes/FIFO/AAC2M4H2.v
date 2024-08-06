module FIFO8x9(
  input clk, rst,
  input RdPtrClr, WrPtrClr, 
  input RdInc, WrInc,
  input [8:0] DataIn,
  output reg [8:0] DataOut,
  input rden, wren
);
//signal declarations

	reg [8:0] fifo_array[7:0];
	reg [7:0] wrptr, rdptr;
	wire [7:0] wr_cnt, rd_cnt;
	
	reg [8:0] mem;

always @(posedge clk or negedge rst)
   begin
	if(rst)	mem <= 9'b000000000;
	if(RdPtrClr) rdptr <= 0;
	if(WrPtrClr) wrptr <= 0;

	if(wren) begin
		fifo_array[wrptr] <= DataIn;
		wrptr = wrptr+WrInc;
	end

	if(rden) begin
		mem <= fifo_array[rdptr];
		rdptr = rdptr+RdInc;
	end
	else mem <= 9'bzzzzzzzzz;
   end

   assign DataOut = mem;
   assign wr_cnt = wrptr;
   assign rd_cnt = rdptr;
endmodule

	