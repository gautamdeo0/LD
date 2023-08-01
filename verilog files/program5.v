module bcddecoder2to4(b0,b1,d0,d1,d2,d3);
	input b0,b1; 	
	output d0,d1,d2,d3;
	wire t0,t1;
	not n1(t0,b0);	
	not n2(t1,b1);	
	and a0(d0,t0,t1);    
	and a1(d1,t0,b1);   
	and a2(d2,b0,t1);   
	and a3(d3,b0,t1);   
endmodule

module test;
	reg b0,b1;
	wire d0,d1,d2,d3;
	bcddecoder2to4 bcdg(b0,b1,d0,d1,d2,d3);
	initial
	begin
		$dumpfile("program5.vcd");
		$dumpvars(0,test);
		b0 = 0; b1 = 0;		     
		#40
		b0 = 0; b1 = 1;		    
		#40
		b0 = 1; b1 = 0;		      
		#40
		b0 = 1; b1 = 1;		      
		#40
		$finish;
	end
endmodule
