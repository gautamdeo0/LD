module andor(A,B,C,D,Y);
	input A,B,C,D;		//inputs for the circuit are a,b,c,d
	output Y;			//y is the output of the circuit
	wire and_op1,and_op2;
		and g1(and_op1,A,B);		//g1 represents an and gate
		and g2(and_op2,C,D); 		//g2 represents an and gate 
		or g3(Y,and_op1,and_op2);   	//g3 represents the or gate
endmodule

module test_andor;
	reg a,b,c,d;	
	wire y;
	andor ao(a,b,c,d,y);
	initial			
	begin
		$dumpfile("program3.vcd");
		$dumpvars(0,test_andor);
		a=0;b=1;c=1;d=1;		
		  #10
		a=0;b=0;c=1;d=0;		
		  #10
		$finish;			 
	end					      
endmodule
