module alu(input [31:0] aluIn1, input [31:0] aluIn2, input [1:0] aluOp, output reg [31:0] aluOut0, output reg [31:0] aluOut1, output reg zero);
    
	// Write your code here
    // out0 corresponds to the lower 32 bits of the result
    // out1 corresponds to the higher 32 bits of the result

    reg [63:0] mul_temp;
	
    always @ (aluIn1, aluIn2, aluOp) begin
        casex (aluOp)
            2'b00: begin
                aluOut0 = aluIn1+aluIn2;
                aluOut1 = 32'h0;
            end
            2'b01: begin
                aluOut0 = aluIn1-aluIn2;
                aluOut1 = 32'h0;
            end
            2'b10: begin
                mul_temp = aluIn1*aluIn2;
                aluOut0 = mul_temp[31:0];
                aluOut1 = mul_temp[63:32];
            end
        endcase
        if(aluOut0 == 32'd0 && aluOut1 == 32'd0) begin
            zero = 1'b1;
        end else begin
            zero = 1'b0;
        end
    end

endmodule