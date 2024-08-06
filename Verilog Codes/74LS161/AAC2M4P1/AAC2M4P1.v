module LS161a(
    input [3:0] D,        // Parallel Input
    input CLK,            // Clock
    input CLR_n,          // Active Low Asynchronous Reset
    input LOAD_n,         // Enable Parallel Input
    input ENP,            // Count Enable Parallel
    input ENT,            // Count Enable Trickle
    output [3:0]Q,        // Parallel Output 	
    output RCO            // Ripple Carry Output (Terminal Count)
); 

reg [3:0] Q_int;
always @(posedge CLK)
begin
	if(!CLR_n)
		Q_int <= 0000;
	else if(CLR_n)
	begin
		if(!LOAD_n)
			Q_int <= D;
		else if(ENP & ENT)
			Q_int <= Q_int+1;
	end
end

assign Q = Q_int;
assign RCO = Q_int[3] & Q_int[2] & Q_int[1] & Q_int[0] & ENT;
endmodule
