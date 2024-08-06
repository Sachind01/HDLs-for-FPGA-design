module ALU ( 
  input [2:0] Op_code,
  input [31:0] A, B,
  output reg [31:0] Y
);

parameter Op_A=3'b000, Op_B=3'b001, Op_C=3'b010, Op_D=3'b011, Op_E=3'b100, Op_F=3'b101, Op_G=3'b110, Op_H=3'b111;
always @(Op_code or A or B)
   begin: ALU_arch
	case(Op_code)
	   Op_A:	if(Op_code) Y<=A;
	   Op_B:	if(Op_code) Y<=A+B;
	   Op_C:	if(Op_code) Y<=A-B;
	   Op_D:	if(Op_code) Y<=A & B;
	   Op_E:	if(Op_code) Y<=A|B;
	   Op_F:	if(Op_code) Y<=A+1;
	   Op_G:	if(Op_code) Y<=A-1;
	   Op_H:	if(Op_code) Y<=B;
	   default: Y<= 32'b0; //default value in case of unknown opcode
   	endcase
   end
endmodule

	   