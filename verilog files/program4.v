module Mux4to1(t1,t2,t3,t4, sel1, sel2,op); //Mux4to1 module declaration with all
	input t1,t2,t3,t4,sel1,sel2;		//involved variables
	output op;
	wire a,b,c,d;
	and a1(a,t1,-sel1,-sel2); 	//a1 is an and gate with a as output, t1,-sel1,-sel2 inputs
	and a2(b,t2,-sel1,sel2);    //Similarly a2,a3,a4 are AND gates with respective  
	and a3(c,t3,sel1,-sel2);     //	inputs and outputs
	and a4(d,t4,sel1,sel2);      
	or o1(op,a,b,c,d);		//o1 is an or gate with op as output, 
endmodule

module test;
	reg t1,t2,t3,t4,sel1,sel2;
	wire op;
	Mux4to1 muxg(t1,t2,t3,t4,sel1,sel2,op);
	initial
	begin
		$dumpfile("program4.vcd");
		$dumpvars(0,test);
		t1=0;t2=0;t3=0;t4=0;sel1=0;sel2=0;      //inputs t1,t2,t3,t4 are given values
		 #20				         
		t1=1;t2=0;t3=0;t4=0;sel1=0;sel2=0;    //inputs t1,t2,t3,t4 are given values
		 #20				         //1,0,0,0 for the next 20ns and sel1=0,sel2=0
		t1=0;t2=0;t3=0;t4=0;sel1=0;sel2=1;    //inputs t1,t2,t3,t4 are given values
		 #20				         //0,0,0,0 for the next 20ns and sel1=0,sel2=1
		t1=1;t2=1;t3=0;t4=0;sel1=0;sel2=1;    //inputs t1,t2,t3,t4 are given values
		 #20				        // 0,0,0,0 for the next 20ns and sel1=1,sel2=1
		t1=0;t2=0;t3=1;t4=0;sel1=1;sel2=0;    //inputs t1,t2,t3,t4 are given values
		 #20				        // 0,0,0,0 for the next 20ns and sel1=1,sel2=0
		t1=1;t2=1;t3=0;t4=1;sel1=1;sel2=0;    //inputs t1,t2,t3,t4 are given values
		 #20				       //  0,0,0,0 for the next 20ns and sel1=1,sel2=0
		t1=1;t2=0;t3=0;t4=1;sel1=1;sel2=1;    //inputs t1,t2,t3,t4 are given values
		 #20				        // 0,0,0,0 for the next 20ns and sel1=1,sel2=1
		t1=0;t2=1;t3=1;t4=0;sel1=1;sel2=1;   //inputs t1,t2,t3,t4 are given values
		 #20				        // 0,0,0,0 for the next 20ns and sel1=1,sel2=1
		$finish;			       // $finish denotes the time duration for which
	end					        // inputs t1,t2,t3,t4 and select lines sel1,sel2
endmodule	
