//ShifterAndALU.v

// select 0 = in0 1 = in1
module mux2to1_3bit(input [2:0] in0, input [2:0] in1, input select, output reg [2:0] muxOut);
  //WRITE CODE HERE

	always @ (in0 or in1 or select) begin
		case (select)
			1'd0 : muxOut = in0;
			1'd1 : muxOut = in1;
		endcase
	end

endmodule

// select 0 = in0 1 = in1
module mux2to1_8bit(input [7:0] in0, input [7:0] in1, input select, output reg [7:0] muxOut);
   //WRITE CODE HERE

	always @ (in0 or in1 or select) begin
		case (select)
			1'd0 : muxOut = in0;
			1'd1 : muxOut = in1;
		endcase
	end

endmodule

module mux8to1_1bit(input in0, input in1, input in2, input in3, input in4, input in5, input in6, input in7, input[2:0] select,output reg muxOut);
   //WRITE CODE HERE

	always @* begin
		case (select)
			3'd0 : muxOut = in0;
			3'd1 : muxOut = in1;
			3'd2 : muxOut = in2;
			3'd3 : muxOut = in3;
			3'd4 : muxOut = in4;
			3'd5 : muxOut = in5;
			3'd6 : muxOut = in6;
			3'd7 : muxOut = in7;
		endcase
	end

endmodule

module barrelshifter(input[2:0] shiftAmt, input[7:0] b, input[2:0] oper, output[7:0] shiftOut);
	//WRITE CODE HERE

	wire [7:0] s;
	wire [7:0] r;
	
	wire [2:0] opt0;
	wire [2:0] opt1;
	wire [2:0] opt2;

	mux2to1_3bit m21_3_0(3'd0, oper, shiftAmt[0], opt0);
	mux8to1_1bit m81_1_0(b[0], b[1], b[1], b[1], 1'b0, b[7], , , opt0, s[0]);
	mux8to1_1bit m81_1_1(b[1], b[2], b[2], b[2], b[0], b[0], , , opt0, s[1]);
	mux8to1_1bit m81_1_2(b[2], b[3], b[3], b[3], b[1], b[1], , , opt0, s[2]);
	mux8to1_1bit m81_1_3(b[3], b[4], b[4], b[4], b[2], b[2], , , opt0, s[3]);
	mux8to1_1bit m81_1_4(b[4], b[5], b[5], b[5], b[3], b[3], , , opt0, s[4]);
	mux8to1_1bit m81_1_5(b[5], b[6], b[6], b[6], b[4], b[4], , , opt0, s[5]);
	mux8to1_1bit m81_1_6(b[6], b[7], b[7], b[7], b[5], b[5], , , opt0, s[6]);
	mux8to1_1bit m81_1_7(b[7], b[7], 1'b0, b[0], b[6], b[6], , , opt0, s[7]);
	
	mux2to1_3bit m21_3_1(3'd0, oper, shiftAmt[1], opt1);
	mux8to1_1bit m81_1_8(s[0], s[2], s[2], s[2], 1'b0, s[6], , , opt1, r[0]);
	mux8to1_1bit m81_1_9(s[1], s[3], s[3], s[3], 1'b0, s[7], , , opt1, r[1]);
	mux8to1_1bit m81_1_10(s[2], s[4], s[4], s[4], s[0], s[0], , , opt1, r[2]);
	mux8to1_1bit m81_1_11(s[3], s[5], s[5], s[5], s[1], s[1], , , opt1, r[3]);
	mux8to1_1bit m81_1_12(s[4], s[6], s[6], s[6], s[2], s[2], , , opt1, r[4]);
	mux8to1_1bit m81_1_13(s[5], s[7], s[7], s[7], s[3], s[3], , , opt1, r[5]);
	mux8to1_1bit m81_1_14(s[6], s[7], 1'b0, s[0], s[4], s[4], , , opt1, r[6]);
	mux8to1_1bit m81_1_15(s[7], s[7], 1'b0, s[1], s[5], s[5], , , opt1, r[7]);
	
	mux2to1_3bit m21_3_2(3'd0, oper, shiftAmt[2], opt2);
	mux8to1_1bit m81_1_16(r[0], r[4], r[4], r[4], 1'b0, r[4], , , opt2, shiftOut[0]);
	mux8to1_1bit m81_1_17(r[1], r[5], r[5], r[5], 1'b0, r[5], , , opt2, shiftOut[1]);
	mux8to1_1bit m81_1_18(r[2], r[6], r[6], r[6], 1'b0, r[6], , , opt2, shiftOut[2]);
	mux8to1_1bit m81_1_19(r[3], r[7], r[7], r[7], 1'b0, r[7], , , opt2, shiftOut[3]);
	mux8to1_1bit m81_1_20(r[4], r[7], 1'b0, r[0], r[0], r[0], , , opt2, shiftOut[4]);
	mux8to1_1bit m81_1_21(r[5], r[7], 1'b0, r[1], r[1], r[1], , , opt2, shiftOut[5]);
	mux8to1_1bit m81_1_22(r[6], r[7], 1'b0, r[2], r[2], r[2], , , opt2, shiftOut[6]);
	mux8to1_1bit m81_1_23(r[7], r[7], 1'b0, r[3], r[3], r[3], , , opt2, shiftOut[7]);

endmodule

// Alu operations are: 00 for alu1, 01 for add, 10 for sub(alu1-alu2) , 11 for AND, 100 for OR and 101 for NOT(alu1)
module alu(input [7:0] aluIn1, input [7:0] aluIn2, input [2:0]aluOp, output reg [7:0] aluOut);
	//WRITE CODE HERE

	always @* begin
		case (aluOp)
			3'd0 : aluOut = aluIn1;
			3'd1 : aluOut = aluIn1+aluIn2;
			3'd2 : aluOut = aluIn1-aluIn2;
			3'd3 : aluOut = aluIn1&aluIn2;
			3'd4 : aluOut = aluIn1|aluIn2;
			3'd5 : aluOut = ~aluIn1;
		endcase
	end

endmodule


module shifterAndALU(input [7:0]inp1, input [7:0] inp2, input [2:0]shiftlmm, input selShiftAmt, input [2:0]oper, input selOut, output [7:0] out);
	//WRITE CODE HERE

	wire [2:0] shiftAmt;
	wire [7:0] shiftOut;
	wire [7:0] aluOut;

	alu alu0(inp1, inp2, oper, aluOut);
	mux2to1_3bit m21_3_0(inp2[2:0], shiftlmm, selShiftAmt, shiftAmt);
	barrelshifter bs0(shiftAmt, inp1, oper, shiftOut);
	mux2to1_8bit m21_8_0(aluOut, shiftOut, selOut, out);

endmodule

//TestBench ALU
module testbenchALU();
	// Input
	reg [7:0] inp1, inp2;
	reg [2:0] aluOp;
	reg [2:0] shiftlmm;
	reg selShiftAmt, selOut;
	// Output
	wire [7:0] aluOut;

	shifterAndALU shifterAndALU_Test (inp1, inp2, shiftlmm, selShiftAmt, aluOp, selOut, aluOut);

	initial
		begin
			$dumpfile("testALU.vcd");
     	$dumpvars(0,testbenchALU);
			inp1 = 8'd80; //80 in binary is 1010000
			inp2 = 8'd20; //20 in binary is 10100   
			shiftlmm = 3'b010; 
			
			aluOp=3'd0; selOut = 1'b0;// normal output = 80

			#10 aluOp = 3'd0; selOut = 1'b1; selShiftAmt = 1'b1; //No shift output = 80

			#10 aluOp=3'd1; selOut = 1'b0;// normal add	output => 20 + 80 = 100

			#10 aluOp = 3'd1; selOut = 1'b1; selShiftAmt = 1'b1; // arithmetic shift right of 80 by 2 places = 20

			#10 aluOp=3'd2; selOut = 1'b0; // normal sub output => 80 - 20 = 60

			#10 aluOp = 3'd2; selOut = 1'b1; selShiftAmt = 1'b0; // logical shift right of 80 by 4 places = 0

			#10 aluOp=3'd3; selOut = 1'b0;// normal and output => 80 & 20 = 16

			#10 aluOp = 3'd3; selOut = 1'b1; selShiftAmt = 1'b0; // Circular Shift Right of 80 by 4 places = 5

			#10 aluOp=3'd4; selOut = 1'b0;// normal or output => 80 | 20 = 84

			#10 aluOp = 3'd4; selOut = 1'b1; selShiftAmt = 1'b1; // Logical Shift Left of 80 by 2 bits = 64

			#10 aluOp=3'd5; selOut = 1'b0; // normal not of 80 = 175

			#10 aluOp = 3'd5; selOut = 1'b1; selShiftAmt = 1'b0; // Circular left shift of 80 by 4 bits = 5

			#10 inp1=8'd15; inp2=8'd26; aluOp=3'd2; selOut = 1'b0;//sub overflow 
			// (15 - 26) = -11 and its a 8 bit number so, 256-11 = 245 output => 245 (since it is unsigned decimal)

			#10 inp1=8'd150; inp2=8'd150; aluOp=3'd1; selOut = 1'b0;// add overflow
			//(150+150) = 300 and its a 8 bit number so, 300-256 = 44 output=> 44.

			#10 inp1=8'b0000_0000; aluOp=3'd5; selOut = 1'b0;//not overflow
			// not(0) = all 1. Since its a 8 bit number output=>255

			#10 $finish;
		end

endmodule
