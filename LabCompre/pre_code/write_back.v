`include "mux.v"

module wb_stage (input mem_to_reg, input [31:0] alu_res, input [31:0] read_data, output [31:0] write_data);

    mux2to1 #(32) mux1(alu_res, read_data, mem_to_reg, write_data);
    
endmodule