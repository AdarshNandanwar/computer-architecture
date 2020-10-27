/**
 * demo.v
 * Author: Raghav Prasad
 * Last modified: 20 August 2020
 */
 
module f_adder(a, b, cin, sum, carry);
	parameter size = 4;
	input	signed	[size-1:0]	a, b, cin;
	output signed	[size-1:0]	sum;
	output carry;
 
	assign {carry, sum} = a+b+cin;
endmodule
 
module testbench;
	parameter size = 4;
	reg signed [size-1:0] a;
	reg signed [size-1:0] b;
	reg signed [size-1:0] cin;
	wire carry;
	wire [size-1:0] sum;
 
	initial begin
		a = 4'd0;
		b = 4'd0;
		cin = 4'd0;
		$dumpfile("f_adder.vcd");
		$dumpvars(0, fadd);
		#10 a = 4'b0010; b = 4'b1011;
		#10 a = 4'b0110; b = 4'b0001;
		#10 a = 4'b1100; b = 4'b0011;
		#10 $finish;
	end
 
	f_adder fadd(a, b, cin, sum, carry);
endmodule