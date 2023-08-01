module gates(input a,b,output[2:0]y);   // Circuit is described by means of their function.
	assign y[2]= a & b; 		//The first output y[0] is defined by ‘AND’ of a,b
	assign y[1]= a |b;		//The output y[1] is defined by ‘OR’ off a,b
	assign y[0]= ~a;		//The output y[2] is defined by and NOT of a
endmodule

module gates_tb;
	wire [2:0]y;
	reg a, b;
	gates aon(a,b,y);
	initial
	begin
		$dumpfile("program11.vcd");
		$dumpvars(0,gates_tb);
		a = 1'b0;		
		b = 1'b0;		   
		    #50;
		a = 1'b0;		
		b = 1'b1;		  
		    #50;
		a = 1'b1;		
		b = 1'b0;		  
		    #50;
		a = 1'b1;		
		b = 1'b1;		  
		    #50;
	end
endmodule
