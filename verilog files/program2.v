module no(t0,a,b,t1);		// start of module no with following variables
	input a,b;			//a and b are inputs for the circuit
	output t0,t1;		//t0 and t1 are outputs for the circuit
	and a1(x1,a,b);		//a1 represents and gate with a,b inputs and x1 output
	not n1(t0,x1);		//n1 represents not gate with x1 input and t0 output
	or o1(x2,a,b);		//o1 represents or gate with a,b inputs and x2 output
	not n2(t1,x2);		//n2 represents not gate with x2 input and t1 output
endmodule		 	// x1,x2 are intermediate inputs/output for respective gates

module testbench;
	wire t0,t1;
	reg a,b;
	no g(t0,a,b,t1);
	initial 			
	begin
	           $dumpfile("program2.vcd");
	           $dumpvars(0,testbench);
	           a = 1'b0 ; b=1'b0;		
	           #20
	           a = 1'b0 ; b=1'b1;		
	           #20
	           a = 1'b1 ; b=1'b0;		
	           #20
	           a = 1'b1 ; b=1'b1;		
	           #20
	           $finish;			
	end					      
endmodule
