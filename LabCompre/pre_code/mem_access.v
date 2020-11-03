`include "memory.v"

module ex_stage (input clk, input reset, input branch, input alu_zero, input mem_write, input mem_read, input [31:0] alu_res, input [31:0] rt_data, output pc_source,output [31:0] read_data);

    and G1(pc_source, branch, alu_zero);
    // ram #(32, 4) data_memory(mem_write, alu_res[5:2], rt_data, mem_read, read_data);
    
endmodule