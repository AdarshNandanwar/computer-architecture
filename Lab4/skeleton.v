module D_ff( input clk, input reset, input regWrite, input decOut1b , input d, output reg q);

//D flip flip for Instruction Memory
module D_ff_IM(input clk, input reset, input d, output reg q);

// select 0 = in0 1 = in1
module mux2to1_5bit(input [4:0] in0, input [4:0] in1, input select, output reg [4:0] muxOut);

// select 0 = in0 1 = in1
module mux2to1_32bit(input [31:0] in0, input [31:0] in1, input select, output reg [31:0] muxOut);

module mux32to1_32bit(input[31:0] in0, input[31:0] in1, input[31:0] in2, input[31:0] in3, input[31:0] in4, input[31:0] in5, input[31:0] in6, input[31:0] in7,
    input[31:0] in8, input[31:0] in9, input[31:0] in10, input[31:0] in11, input[31:0] in12, input[31:0] in13, input[31:0] in14, input[31:0] in15,
    input[31:0] in16, input[31:0] in17, input[31:0] in18, input[31:0] in19, input[31:0] in20, input[31:0] in21, input[31:0] in22, input[31:0] in23,
    input[31:0] in24, input[31:0] in25, input[31:0] in26, input[31:0] in27, input[31:0] in28, input[31:0] in29, input[31:0] in30, input[31:0] in31,input[4:0] select,output reg[31:0] muxOut);

// mux to be used in Instruction Memory and Data Memory
module mux128to1_IM_DM(input [7:0] in0,   input [7:0] in1,   input [7:0] in2,   input [7:0] in3,
                    input [7:0] in4,   input [7:0] in5,   input [7:0] in6,   input [7:0] in7,
                    input [7:0] in8,   input [7:0] in9,   input [7:0] in10,  input [7:0] in11,
                    input [7:0] in12,  input [7:0] in13,  input [7:0] in14,  input [7:0] in15,
                    input [7:0] in16,  input [7:0] in17,  input [7:0] in18,  input [7:0] in19,
                    input [7:0] in20,  input [7:0] in21,  input [7:0] in22,  input [7:0] in23,
                    input [7:0] in24,  input [7:0] in25,  input [7:0] in26,  input [7:0] in27,
                    input [7:0] in28,  input [7:0] in29,  input [7:0] in30,  input [7:0] in31,
                    input [7:0] in32,  input [7:0] in33,  input [7:0] in34,  input [7:0] in35,
                    input [7:0] in36,  input [7:0] in37,  input [7:0] in38,  input [7:0] in39,
                    input [7:0] in40,  input [7:0] in41,  input [7:0] in42,  input [7:0] in43,
                    input [7:0] in44,  input [7:0] in45,  input [7:0] in46,  input [7:0] in47,
                    input [7:0] in48,  input [7:0] in49,  input [7:0] in50,  input [7:0] in51,
                    input [7:0] in52,  input [7:0] in53,  input [7:0] in54,  input [7:0] in55,
                    input [7:0] in56,  input [7:0] in57,  input [7:0] in58,  input [7:0] in59,
                    input [7:0] in60,  input [7:0] in61,  input [7:0] in62,  input [7:0] in63,
                    input [7:0] in64,  input [7:0] in65,  input [7:0] in66,  input [7:0] in67,
                    input [7:0] in68,  input [7:0] in69,  input [7:0] in70,  input [7:0] in71,
                    input [7:0] in72,  input [7:0] in73,  input [7:0] in74,  input [7:0] in75,
                    input [7:0] in76,  input [7:0] in77,  input [7:0] in78,  input [7:0] in79,
                    input [7:0] in80,  input [7:0] in81,  input [7:0] in82,  input [7:0] in83,
                    input [7:0] in84,  input [7:0] in85,  input [7:0] in86,  input [7:0] in87,
                    input [7:0] in88,  input [7:0] in89,  input [7:0] in90,  input [7:0] in91,
                    input [7:0] in92,  input [7:0] in93,  input [7:0] in94,  input [7:0] in95,
                    input [7:0] in96,  input [7:0] in97,  input [7:0] in98,  input [7:0] in99,
                    input [7:0] in100, input [7:0] in101, input [7:0] in102, input [7:0] in103,
                    input [7:0] in104, input [7:0] in105, input [7:0] in106, input [7:0] in107,
                    input [7:0] in108, input [7:0] in109, input [7:0] in110, input [7:0] in111,
                    input [7:0] in112, input [7:0] in113, input [7:0] in114, input [7:0] in115,
                    input [7:0] in116, input [7:0] in117, input [7:0] in118, input [7:0] in119,
                    input [7:0] in120, input [7:0] in121, input [7:0] in122, input [7:0] in123,
                    input [7:0] in124, input [7:0] in125, input [7:0] in126, input [7:0] in127,
                    input [4:0] select, output reg [31:0] muxOut);

//Active high decoder
module decoder_5to32(input[4:0] in, output reg[31:0] decOut);

//32 bit register
module register32bit(input clk, input reset, input regWrite, input decoderOut1bit, input[31:0] writeData, output[31:0] regOut);
//A N-bit register consists of N D flip-flops, each storing a bit of data.
//In this case, there will be 32 instances of D_ff, each taking writeData[0]...[31] as the d input and regOut[0]...[31] as the q output

//register for Instruction Memory
module register_IM(input clk, input reset, input [7:0] d_in, output [7:0] q_out);

//register set with 32 registers
module registerSet(input clk, input reset, input regWrite, input[31:0] decoderOut, input[31:0] writeData,
    output [31:0] outR0, output[31:0] outR1, output[31:0] outR2, output[31:0] outR3, output[31:0] outR4, output[31:0] outR5, output[31:0] outR6, output[31:0] outR7,
    output [31:0] outR8, output[31:0] outR9, output[31:0] outR10, output[31:0] outR11, output[31:0] outR12, output[31:0] outR13, output[31:0] outR14, output[31:0] outR15,
    output [31:0] outR16, output[31:0] outR17, output[31:0] outR18, output[31:0] outR19, output[31:0] outR20, output[31:0] outR21, output[31:0] outR22, output[31:0] outR23,
    output [31:0] outR24, output[31:0] outR25, output[31:0] outR26, output[31:0] outR27, output[31:0] outR28, output[31:0] outR29, output[31:0] outR30, output[31:0] outR31);

//register file for single cycle
module registerFile(input clk, input reset, input regWrite, input[4:0] rs, input[4:0] rt, input[4:0] rd, input[31:0] writeData, output[31:0] regRs, output[31:0] regRt);

//instruction memory for single cycle
module IM(input clk, input reset, input [4:0] pc_5bits, output [31:0] IR);

/* ################ GIVEN ENDS HERE ################ */

//D flip flop for Data Memory
//works on negative edge of clock
// if reset is set make output 0
// else make it d when both regwrite and decOut1b are set.
module Dff_DM(input clk, input reset, input regWrite, input decOut1b , input d, output reg q);

//register for Data Memory
//use D flip flops for DM defined above
module register8bit_DM(input clk, input reset, input regWrite, input decOut1b, input [7:0] inR,
                     output [7:0] outR);

// Data Memory for single cycle
// since address line is 5 bits i.e. 32 registers of 32 bit each is required
// we have defined 8 bit register_DM above, hence we require 4 of them for each 32 bit to store
// Remember data is stored in Big endian form in MIPS
module DM(input clk, input reset, input memWrite,input memRead, input [4:0] address, input [31:0] writeData , output [31:0] read_data);

//add given two inputs
module adder(input [31:0] in1, input [31:0] in2, output reg [31:0] adder_out);

// if number is -ve append all 1's at the start else append all 0's
module signExt16to32( input [15:0] offset, output reg [31:0] signExtOffset);

// follow the table given in question pdf
module aluCtrl(input [1:0] aluOp, input [5:0] fun,output reg [3:0] operation);

// follow the table of control circuit given in pdf
module ctrlCkt	(input [5:0] opcode, output reg RegDst ,output reg jump, output reg ALUSrc, output reg MemtoReg, output reg RegWrite,
                  output reg MemRead , output reg MemWrite, output reg Branch , output reg [1:0]ALUOp );

//perform airthemtic or logical operations based on value of "operation"
module alu(input [31:0] aluIn1, input [31:0] aluIn2,input [3:0]operation ,output reg zero,output reg [31:0]aluOut);

module singleCycle(input clk, input reset);

module singleCycleTestBench;
