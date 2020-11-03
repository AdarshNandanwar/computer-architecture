`include "sign_ext.v"
`include "control.v"

module id_stage (input clk, input reset, input [31:0] instruction, input reg_write_in, input [31:0] write_data, input [4:0] write_reg, output reg_write_out, output mem_to_reg, output branch, output mem_write, output mem_read, output alu_src, output [1:0] alu_op, output reg_dst, output [31:0] branch_imm, output [31:0] rs_data, output [31:0] rt_data);

    sign_ext #(16, 32) se(instruction[15:0], branch_imm);
    register_file rf_main(clk, reset, reg_write_in, instruction[25:21], instruction[20:16], write_reg, write_data, rs_data, rt_data);
    // control_unit cu(instruction[31:26], reg_write_out, mem_to_reg, branch, mem_write, mem_read, alu_src, alu_op, reg_dst);
    
endmodule