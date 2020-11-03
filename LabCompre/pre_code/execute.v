`include "alu.v"
`include "alu_control.v"

module ex_stage (input alu_src, input [1:0] alu_op, input reg_dst, input [31:0] pc_next, input [31:0] branch_imm, input [31:0] rs_data, input [31:0] rt_data, input [4:0] rt, input [4:0] rd, output [31:0] pc_branch, output alu_zero, output [31:0] alu_res, output [4:0] write_reg);

    wire [3:0] operation;
    wire [31:0] alu_in1;
    mux2to1 #(32) mux1(rt_data, branch_imm, alu_src, alu_in1);
    // alu_control alu_control1(branch_imm[5:0], alu_op, operation);
    // alu alu1(rs_data, alu_in1, operation, alu_zero, alu_res);
    // check dest or dst
    mux2to1 #(5) mux2(rt, rd, reg_dst, write_reg);
    assign pc_branch = pc_next+{branch_imm[29:0], 2'b00};

    
endmodule