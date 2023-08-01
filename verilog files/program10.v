module counter_behav(count,rst,clk);
	input rst,clk;
	output reg [2:0] count;
	always@(posedge clk)  //code executed for every positive edge
	if(rst)
		count<=3'b000;
	else
		count<=count+1; //clock pulse count incremented
endmodule

module test_mod;
	reg r,c;
	wire [2:0] ct;
	counter_behav countbeh(ct,r,c);
	initial
	begin
		$dumpfile("program10.vcd");
		$dumpvars(0,test_mod);
	r=1;				//for first 100ns reset r has value 1, clock c has value 0
	c=0;
	#100;				//for next 200ns reset r has value 0, clock c
	r=0;
	#200 $finish;
	end
	always #5 c=~c;
endmodule
