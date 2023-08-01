module JK_FF(jk , clk, q, qb);
	input[1:0]jk;
	input clk;
	output reg q=1'b0; //storage elemnts synthesized for sequential ciruit
	output reg qb;
	always@(posedge clk)
	begin
		case(jk)
			2'b00:q=q;  		//Q(n+1) = Qn , 0 , 1, (Qn)’
			2'b01:q=1'b0;
			2'b10:q=1'b1;
			2'b11:q=~q;
		endcase
		qb=~q;
	end
endmodule

module test_jkflipf;
	reg[1:0]A;
	reg c;
	wire x,xb;
	JK_FF srff(A,c,x,xb);
	initial c=1'b0;
	always #5 c=~c;	//for every 5ns c is complemented forever
	initial
	begin
	          $dumpfile("program8.vcd"); //all variables of module dumped to jk_test1.vcd
	          $dumpvars(0,test_jkflipf);
	A=2'b00;#10;
	A=2'b01;#10;
	A=2'b10;#10;
	A=2'b11;
	#20 $finish;
	end 
endmodule
