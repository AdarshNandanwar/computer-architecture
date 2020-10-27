module control_circuit (input clk, input reset, input [5:0] opcode, input [5:0] funct, 
                        output reg IorD, output reg memRead, output reg IRWrite, output reg regDest, output reg regWrite,
                        output reg aluSrcA, output reg [1:0] aluSrcB, output reg [1:0] aluOp, output reg hiWrite,
                        output reg loWrite, output reg [1:0] memToReg, output reg [1:0] pcSrc, output reg pcWrite,
                        output reg branch );

    reg [3:0] state;

    // Write your code here

    // state must update on every negedge of clk

    // the outputs have to be assigned as per the value of state

    always @ (negedge clk) begin
        if(reset) begin
            state <= 4'd0;
            IorD <= 1'b0;
            memRead <= 1'b0;
            IRWrite <= 1'b0;
            regDest <= 1'b0;
            regWrite <= 1'b0;
            aluSrcA <= 1'b0;
            aluSrcB <= 2'b00;
            aluOp <= 2'b00;
            hiWrite <= 1'b0;
            loWrite <= 1'b0;
            memToReg <= 2'b00;
            pcSrc <= 2'b00;
            pcWrite <= 1'b0;
            branch <= 1'b0;
        end
        case (state)
            4'd0: begin
                state <= 4'd1;
                IorD <= 1'b0;
                memRead <= 1'b1;
                IRWrite <= 1'b1;
                regDest <= 1'b0;
                regWrite <= 1'b0;
                aluSrcA <= 1'b0;
                aluSrcB <= 2'b01;
                aluOp <= 2'b00;
                hiWrite <= 1'b0;
                loWrite <= 1'b0;
                memToReg <= 2'b00;
                pcSrc <= 2'b10;
                pcWrite <= 1'b1;
                branch <= 1'b0;
            end
            4'd1: begin
                state <= 4'd2;
                IorD <= 1'b0;
                memRead <= 1'b0;
                IRWrite <= 1'b0;
                regDest <= 1'b0;
                regWrite <= 1'b0;
                aluSrcA <= 1'b0;
                aluSrcB <= 2'b11;
                aluOp <= 2'b00;
                hiWrite <= 1'b0;
                loWrite <= 1'b0;
                memToReg <= 2'b00;
                pcSrc <= 2'b00;
                pcWrite <= 1'b0;
                branch <= 1'b0;
            end
            4'd2: begin
                case(opcode)
                    // addi
                    6'b001000: begin
                        state <= 4'd3;
                        IorD <= 1'b0;
                        memRead <= 1'b0;
                        IRWrite <= 1'b0;
                        regDest <= 1'b0;
                        regWrite <= 1'b0;
                        aluSrcA <= 1'b1;
                        aluSrcB <= 2'b10;
                        aluOp <= 2'b00;
                        hiWrite <= 1'b0;
                        loWrite <= 1'b0;
                        memToReg <= 2'b00;
                        pcSrc <= 2'b00;
                        pcWrite <= 1'b0;
                        branch <= 1'b0;
                    end
                    // mult
                    6'b011000: begin
                        state <= 4'd4;
                        IorD <= 1'b0;
                        memRead <= 1'b0;
                        IRWrite <= 1'b0;
                        regDest <= 1'b0;
                        regWrite <= 1'b0;
                        aluSrcA <= 1'b1;
                        aluSrcB <= 2'b00;
                        aluOp <= 2'b10;
                        hiWrite <= 1'b0;
                        loWrite <= 1'b0;
                        memToReg <= 2'b0;
                        pcSrc <= 2'b0;
                        pcWrite <= 1'b0;
                        branch <= 1'b0;
                    end
                    // mfhi
                    6'b010000: begin
                        state <= 4'd5;
                        IorD <= 1'b0;
                        memRead <= 1'b0;
                        IRWrite <= 1'b0;
                        regDest <= 1'b1;
                        regWrite <= 1'b1;
                        aluSrcA <= 1'b0;
                        aluSrcB <= 2'b00;
                        aluOp <= 2'b00;
                        hiWrite <= 1'b0;
                        loWrite <= 1'b0;
                        memToReg <= 2'b01;
                        pcSrc <= 2'b00;
                        pcWrite <= 1'b0;
                        branch <= 1'b0;
                    end
                    // lw
                    6'b100011: begin
                        state <= 4'd6;
                        IorD <= 1'b0;
                        memRead <= 1'b0;
                        IRWrite <= 1'b0;
                        regDest <= 1'b0;
                        regWrite <= 1'b0;
                        aluSrcA <= 1'b1;
                        aluSrcB <= 2'b10;
                        aluOp <= 2'b00;
                        hiWrite <= 1'b0;
                        loWrite <= 1'b0;
                        memToReg <= 2'b00;
                        pcSrc <= 2'b00;
                        pcWrite <= 1'b0;
                        branch <= 1'b0;
                    end
                    // j
                    6'b000010: begin
                        state <= 4'd7;
                        IorD <= 1'b0;
                        memRead <= 1'b0;
                        IRWrite <= 1'b0;
                        regDest <= 1'b0;
                        regWrite <= 1'b0;
                        aluSrcA <= 1'b0;
                        aluSrcB <= 2'b00;
                        aluOp <= 2'b00;
                        hiWrite <= 1'b0;
                        loWrite <= 1'b0;
                        memToReg <= 2'b00;
                        pcSrc <= 2'b01;
                        pcWrite <= 1'b1;
                        branch <= 1'b0;
                    end
                    // beq
                    6'b000100: begin
                        state <= 4'd8;
                        IorD <= 1'b0;
                        memRead <= 1'b0;
                        IRWrite <= 1'b0;
                        regDest <= 1'b0;
                        regWrite <= 1'b0;
                        aluSrcA <= 1'b1;
                        aluSrcB <= 2'b00;
                        aluOp <= 2'b01;
                        hiWrite <= 1'b0;
                        loWrite <= 1'b0;
                        memToReg <= 2'b00;
                        pcSrc <= 2'b00;
                        pcWrite <= 1'b0;
                        branch <= 1'b1;
                    end
                    default: begin
                        state <= 4'd8;
                        IorD <= 1'b0;
                        memRead <= 1'b0;
                        IRWrite <= 1'b0;
                        regDest <= 1'b0;
                        regWrite <= 1'b0;
                        aluSrcA <= 1'b1;
                        aluSrcB <= 2'b00;
                        aluOp <= 2'b01;
                        hiWrite <= 1'b0;
                        loWrite <= 1'b0;
                        memToReg <= 2'b00;
                        pcSrc <= 2'b00;
                        pcWrite <= 1'b0;
                        branch <= 1'b1;
                    end
                endcase
            end
            4'd3: begin
                state <= 4'd9;
                IorD <= 1'b0;
                memRead <= 1'b0;
                IRWrite <= 1'b0;
                regDest <= 1'b0;
                regWrite <= 1'b1;
                aluSrcA <= 1'b0;
                aluSrcB <= 2'b00;
                aluOp <= 2'b00;
                hiWrite <= 1'b0;
                loWrite <= 1'b0;
                memToReg <= 2'b10;
                pcSrc <= 2'b00;
                pcWrite <= 1'b0;
                branch <= 1'b0;
            end
            4'd4: begin
                state <= 4'd10;
                IorD <= 1'b0;
                memRead <= 1'b0;
                IRWrite <= 1'b0;
                regDest <= 1'b0;
                regWrite <= 1'b0;
                aluSrcA <= 1'b0;
                aluSrcB <= 2'b00;
                aluOp <= 2'b00;
                hiWrite <= 1'b1;
                loWrite <= 1'b1;
                memToReg <= 2'b00;
                pcSrc <= 2'b00;
                pcWrite <= 1'b0;
                branch <= 1'b0;
            end
            4'd5: begin
                state <= 4'd1;
                IorD <= 1'b0;
                memRead <= 1'b1;
                IRWrite <= 1'b1;
                regDest <= 1'b0;
                regWrite <= 1'b0;
                aluSrcA <= 1'b0;
                aluSrcB <= 2'b01;
                aluOp <= 2'b00;
                hiWrite <= 1'b0;
                loWrite <= 1'b0;
                memToReg <= 2'b00;
                pcSrc <= 2'b10;
                pcWrite <= 1'b1;
                branch <= 1'b0;
            end
            4'd6: begin
                state <= 4'd11;
                IorD <= 1'b1;
                memRead <= 1'b1;
                IRWrite <= 1'b0;
                regDest <= 1'b0;
                regWrite <= 1'b0;
                aluSrcA <= 1'b0;
                aluSrcB <= 2'b00;
                aluOp <= 2'b00;
                hiWrite <= 1'b0;
                loWrite <= 1'b0;
                memToReg <= 2'b00;
                pcSrc <= 2'b00;
                pcWrite <= 1'b0;
                branch <= 1'b0;
            end
            4'd7: begin
                state <= 4'd1;
                IorD <= 1'b0;
                memRead <= 1'b1;
                IRWrite <= 1'b1;
                regDest <= 1'b0;
                regWrite <= 1'b0;
                aluSrcA <= 1'b0;
                aluSrcB <= 2'b01;
                aluOp <= 2'b00;
                hiWrite <= 1'b0;
                loWrite <= 1'b0;
                memToReg <= 2'b00;
                pcSrc <= 2'b10;
                pcWrite <= 1'b1;
                branch <= 1'b0;
            end
            4'd8: begin
                state <= 4'd1;
                IorD <= 1'b0;
                memRead <= 1'b1;
                IRWrite <= 1'b1;
                regDest <= 1'b0;
                regWrite <= 1'b0;
                aluSrcA <= 1'b0;
                aluSrcB <= 2'b01;
                aluOp <= 2'b00;
                hiWrite <= 1'b0;
                loWrite <= 1'b0;
                memToReg <= 2'b00;
                pcSrc <= 2'b10;
                pcWrite <= 1'b1;
                branch <= 1'b0;
            end
            4'd9: begin
                state <= 4'd1;
                IorD <= 1'b0;
                memRead <= 1'b1;
                IRWrite <= 1'b1;
                regDest <= 1'b0;
                regWrite <= 1'b0;
                aluSrcA <= 1'b0;
                aluSrcB <= 2'b01;
                aluOp <= 2'b00;
                hiWrite <= 1'b0;
                loWrite <= 1'b0;
                memToReg <= 2'b00;
                pcSrc <= 2'b10;
                pcWrite <= 1'b1;
                branch <= 1'b0;
            end
            4'd10: begin
                state <= 4'd1;
                IorD <= 1'b0;
                memRead <= 1'b1;
                IRWrite <= 1'b1;
                regDest <= 1'b0;
                regWrite <= 1'b0;
                aluSrcA <= 1'b0;
                aluSrcB <= 2'b01;
                aluOp <= 2'b00;
                hiWrite <= 1'b0;
                loWrite <= 1'b0;
                memToReg <= 2'b00;
                pcSrc <= 2'b10;
                pcWrite <= 1'b1;
                branch <= 1'b0;
            end
            4'd11: begin
                state <= 4'd12;
                IorD <= 1'b0;
                memRead <= 1'b0;
                IRWrite <= 1'b0;
                regDest <= 1'b0;
                regWrite <= 1'b1;
                aluSrcA <= 1'b0;
                aluSrcB <= 2'b00;
                aluOp <= 2'b00;
                hiWrite <= 1'b0;
                loWrite <= 1'b0;
                memToReg <= 2'b00;
                pcSrc <= 2'b00;
                pcWrite <= 1'b0;
                branch <= 1'b0;
            end
            4'd12: begin
                state <= 4'd1;
                IorD <= 1'b0;
                memRead <= 1'b1;
                IRWrite <= 1'b1;
                regDest <= 1'b0;
                regWrite <= 1'b0;
                aluSrcA <= 1'b0;
                aluSrcB <= 2'b01;
                aluOp <= 2'b00;
                hiWrite <= 1'b0;
                loWrite <= 1'b0;
                memToReg <= 2'b00;
                pcSrc <= 2'b10;
                pcWrite <= 1'b1;
                branch <= 1'b0;
            end
            default: begin
                state <= 4'd0;
                IorD <= 1'b0;
                memRead <= 1'b0;
                IRWrite <= 1'b0;
                regDest <= 1'b0;
                regWrite <= 1'b0;
                aluSrcA <= 1'b0;
                aluSrcB <= 2'b00;
                aluOp <= 2'b00;
                hiWrite <= 1'b0;
                loWrite <= 1'b0;
                memToReg <= 2'b00;
                pcSrc <= 2'b00;
                pcWrite <= 1'b0;
                branch <= 1'b0;
            end
        endcase
    end

endmodule