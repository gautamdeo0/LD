module SR_FF(sr , clk, q, qb);
	input[1:0]sr;		//[1:0]sr represents the RS Flip-flop input
	input clk;		//clk represents the clock of the circuit
	output reg q=1'b0; 	//q and qb represent data storage elements synthesized 
	output reg qb;		//for sequential logic circuit
	always@(posedge clk)	//code inside block executed at every positive edge
	begin
		case(sr)
			2'b00:q=q;	//statements which demonstrate the flip-flops behavior
			2'b01:q=1'b0;	//based on the inputs
			2'b10:q=1'b1;
			2'b11:q=1'bz;	//forbidden state
		endcase
		qb=~q;
	end
endmodule

module test_srflipf;
	reg[1:0]A;
	reg c;
	SR_FF srff(A,c,x,xb);
	initial c=1'b0;
	always #5 c=~c;
	initial
	begin
		$dumpfile("program7.vcd");
		$dumpvars(0,test_srflipf);
	A=2'b00;#10;      //For first 10ns, value of A is 00, in the next 10ns the value is 01
	A=2'b01;#10;	//Then 10 and later 11.(This stage is allowed for 20ns)
	A=2'b10;#10;
	A=2'b11;
	#20 $finish;	//$finish denotes end of the time duration for which values are given
	end 
endmodule
