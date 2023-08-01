module adder(input a, input b,input cin, output cout);
	assign s = a^b^cin;
	assign cout= (a&b) |(a& cin) |(b & cin);
endmodule

module test1;
	reg a, b,cin;
	wire s , cout;
	adder FA (a,b,cin,cout);
	initial
	begin
		$dumpfile("program12.vcd");
		$dumpvars(0,test1);
		a = 1;			//for first 5ns, a and b have values 1,1 and carry-in
		b = 1;			   //has value 0
		 cin = 0; #5
		a = 1;			//for next 5ns, a and b have values 1,1 and carry-in
		b = 1;			   //has value 1
		   cin = 1; #5
		a = 0;			//for next 5ns, a and b have values 0,1 and carry-in
		b = 1;			  // has value 0
		   cin = 0; #5
		#10 $finish;		//the state is continued for 10ns ore after which time 
	end				 //duration is ended using $finish command
endmodule
