`include "alu.v"
`include "control.v"
`include "dff.v"
`include "memory.v"
`include "mux.v"
`include "register_file.v"
`include "registers.v"
`include "sign_ext.v"

module multi_cycle (input clk, input reset, output [31:0] result);
    
    // Write your code here

    // make sure that the im module is instantiated as "instruction memory"    
    
    wire regWr, memRead, pcWrite, branch, outAnd1, zero, IRWrite, aluSrcA, IorD, regDest, regWrite, hiWrite, loWrite;
    wire [1:0] aluSrcB, memToReg, aluOp, pcSrc;
    wire[4:0] outMux1, outMux2;
    wire[31:0] inPC, outPC, outIM, outIR, outMDR, writeData, outRF0, outRF1, outA, outB, outSE, outMux3, outMux4, aluOut0, aluOut1, inHi, outHi, outLo;

    intermediate_reg #(32) PC(clk, reset, regWr, inPC, outPC);
    mux2to1 #(5) mux1(outPC[6:2], result[6:2], IorD, outMux1);
    and and1(outAnd1, branch, zero);
    or or1(regWr, pcWrite, outAnd1);
    im #(32, 5) instruction_memory(clk, reset, outMux1, memRead, outIM);

    intermediate_reg #(32) IR(clk, reset, IRWrite, outIM, outIR);
    intermediate_reg #(32) MDR(clk, reset, 1'b1, outIM, outMDR);

    mux2to1 #(5) mux2(outIR[20:16], outIR[15:11], regDest, outMux2);
    register_file RF(clk, reset, regWrite, outIR[25:21], outIR[20:16], outMux2, writeData, outRF0, outRF1);

    intermediate_reg #(32) A(clk, reset, 1'b1, outRF0, outA);
    intermediate_reg #(32) B(clk, reset, 1'b1, outRF1, outB);

    sign_ext #(16, 32) SE1(outIR[15:0], outSE);

    mux2to1 #(32) mux3(outPC, outA, aluSrcA, outMux3);
    mux4to1 #(32) mux4(outB, 32'd4, outSE, {outSE[29:0], 2'b00}, aluSrcB, outMux4);

    alu alu1(outMux3, outMux4, aluOp, aluOut0, aluOut1, zero);
    intermediate_reg #(32) out0(clk, reset, 1'b1, aluOut0, result);
    intermediate_reg #(32) out1(clk, reset, 1'b1, aluOut1, inHi);
    intermediate_reg #(32) hi(clk, reset, hiWrite, inHi, outHi);
    intermediate_reg #(32) lo(clk, reset, loWrite, result, outLo);

    mux4to1 #(32) mux5(outMDR, outHi, result, 32'd0, memToReg, writeData);

    control_circuit ctrlCkt(clk, reset, outIR[31:26], outIR[5:0], IorD, memRead, IRWrite, regDest, regWrite, aluSrcA, aluSrcB, aluOp, hiWrite, loWrite, memToReg, pcSrc, pcWrite, branch);

    mux4to1 #(32) mux6(result, {outPC[31:28], outIR[25:0], 2'b00}, aluOut0, 32'd0, pcSrc, inPC);

endmodule