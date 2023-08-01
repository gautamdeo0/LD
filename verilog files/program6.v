module encoder4to2( b0,b1,d0,d1,d2,d3 );
	output b0,b1;
	input d0,d1,d2,d3;
	not n0(t0,d0);	//n0,n1,n2.n3 represent the NOT gates
	not n1(t1,d1);
	not n2(t2,d2);
	not n3(t3,d3);
	and a0(t4,t0,t1,d2,t3);	//a0,a1,a2,a3 represent the AND gates
	and a1(t5,t0,t1,t2,d3);
	and a2(t6,t0,d1,t2,t3);
	and a3(t7,t0,t1,t2,t3);
	or o0(b0,t4,t3);		//o0,o1 represent the OR gates
	or o1(b1,t6,d3);
endmodule

module test;
	wire b0,b1;
	reg d0,d1,d2,d3;
	encoder4to2 encg(b0,b1,d0,d1,d2,d3);
	initial
 	begin
		$dumpfile("program6.vcd");
		$dumpvars(0,test);
 		d0 = 1;d1 = 0;d2 = 0;d3 = 0;      //for the first 40ns inputs d0,d1,d2,d3 have
		 #40;		      		          // the values 0,0,0,0
		d0 = 0;d1 = 1;d2 = 0;d3 = 0;      //for the next 40ns inputs d0,d1,d2,d3 have
		 #40;					//the values 0,1,0,0
		d0 = 0;d1 = 0;d2 = 1;d3 = 0;     //for the next 40ns inputs d0,d1,d2,d3 have
		 #40;					//the values 0,0,1,0
		d0 = 0;d1 = 0;d2 = 0;d3 = 1;     //for the next 40ns inputs d0,d1,d2,d3 have
		#40;					//the values 0,0,0,1
	end
endmodule
