`timescale 1ns / 1ps

module ripple_carry_adder_subtractor(input [3:0] A, input [3:0] B, input Op, output [3:0] S, output C);

	// Write your ripple carry adder subtractor code here

	wire w0, w1, w2, w3, c1, c2, c3;

	xor G1(w0, Op, B[0]);	
	xor G2(w1, Op, B[1]);	
	xor G3(w2, Op, B[2]);	
	xor G4(w3, Op, B[3]);	
	full_adder F1(S[0], c1, A[0], w0, Op);
	full_adder F2(S[1], c2, A[1], w1, c1);
	full_adder F3(S[2], c3, A[2], w2, c2);
	full_adder F4(S[3], C, A[3], w3, c3);

endmodule

module full_adder(output S, output Cout, input A, input B, input Cin);

	// Write your full adder code here

	wire w1, w2, w3;

	xor G1(w1, A, B);
	xor G2(S, w1, Cin);
	and G3(w2, A, B);
	and G4(w3, w1, Cin);
	or G5(Cout, w2, w3);

endmodule

module rcas_test;

	reg [3:0] A;
	reg [3:0] B;
        reg Op;
	wire [3:0] S;
	wire C;

	// Instantiate the Unit Under Test (UUT)
	ripple_carry_adder_subtractor uut ( A, B, Op,S, C);

	initial begin
		$dumpfile("ripple_carry_adder_subtractor.vcd");
		$dumpvars(0, rcas_test);
		A=4'b0011 ;
		B=4'b0010 ;
		Op=0;
		#10 A=4'b1111; B=4'b1111; Op=0;
		#10 A=4'b1100; B=4'b0100; Op=1;
		#10 A=4'b0011; B=4'b1010; Op=1;
		#10 A=4'b0100; B=4'b1100; Op=0;
		#10 $finish;
	end
endmodule
