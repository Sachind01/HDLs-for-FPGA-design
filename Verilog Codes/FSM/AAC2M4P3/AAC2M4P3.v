module FSM(
  input In1,
  input RST,
  input CLK, 
  output reg Out1
);

reg [1:0] ps, ns;
parameter A=2'b00, B=2'b01, C=2'b10;

always @(posedge CLK or negedge RST)
   begin: register_generation
	if(CLK)	ps <= ns;
	else ps <= ps;
   end

always @(ps or In1)
   begin: ns_logic
	case(ps)
	   A: if(In1==1'b1) ns <= B;
	      else ns <= A;
	   B: if(In1==1'b0) ns <= C;
	      else ns <= B;
	   C: if(In1==1'b1) ns <= A;
	      else ns <= C;
	   default : ns <= A;
	endcase
   end
always @(ps)
   begin: output_logic
	case(ps)
	   A: Out1 = 1'b0;
	   B: Out1 = 1'b0;
	   C: Out1 = 1'b1;
	   default: Out1 = 1'b0;//to avoid latch gen
	endcase
   end
endmodule