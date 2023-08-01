module gates(a,b,c,t0,t1,t2);	// start of module gates with following variables
	input a,b,c;		// the inputs to the given circuit are a,b,c
	output t0,t1,t2;	//the outputs from the gates are t0,t1,t2
	and ag(t0,a,b);	// and gate ag takes input a,b and gives output t0
	or og(t1,a,b);	// or gate og takes input a,b and gives output t1
	not notg(t2,c);	// not gate notg takes c as input and gives output t2
endmodule			//end of the module

module testbench;		//start of testbench
	reg a,b,c;   //a,b,c are data storage elements , synthesized to combinational circuit
	wire t0,t1,t2;    	//t0,t1,t2 are assigned to be connected
	gates g(a,b,c,t0,t1,t2);
	initial				//initial processes execute only once
	begin
	     $dumpfile("program1.vcd"); //Level set to 0 implies that all variables of module
	     $dumpvars(0,testbench);  //into the gates.vcd file(to show output in gtkwave)
	      a = 1'b0 ; b= 1'b0 ; c= 1'b0;	    //for the first 20ns inputs a,b,c are given values
	      #20				       //0,0,1 represented by a single bit
	      a = 1'b0 ; b= 1'b1 ; c= 1'b0;	    
	      #20				     
	      a = 1'b1 ; b= 1'b0 ; c= 1'b0;	    
	      #20
	      a = 1'b1 ; b= 1'b1 ; c= 1'b0;	    
	      #20
	      a = 1'b0 ; b= 1'b0 ; c= 1'b1;	    
	      #20
	      a = 1'b0 ; b= 1'b0 ; c= 1'b0;	    
	      #20
	      $finish;				    
	end					     
endmodule
