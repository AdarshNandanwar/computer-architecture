`include "mux.v"
`include "dff.v"

module if_stage (input clk, input reset, input [31:0] pc_branch, input pc_source, output [31:0] pc_next, output [31:0] instruction);

    wire [31:0] dff_p_in, pc_current;
    mux2to1 #(32) mux1(pc_next, pc_branch, pc_source, dff_p_in);
    dff_p #(32) program_counter(clk, reset, 1'b1, dff_p_in, pc_current);
    // rom #(32, 6) instr_memory(clk, reset, pc_current[7:2], instruction);
    assign pc_next = pc_current+32'h00000004;
    
endmodule