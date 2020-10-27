module control_circuit (input clk, input reset, input [5:0] opcode, input [5:0] funct, 
                        output reg IorD, output reg memRead, output reg IRWrite, output reg regDest, output reg regWrite,
                        output reg aluSrcA, output reg [1:0] aluSrcB, output reg [1:0] aluOp, output reg hiWrite,
                        output reg loWrite, output reg [1:0] memToReg, output reg [1:0] pcSrc, output reg pcWrite,
                        output reg branch );
 
    reg [3:0] state;
    initial begin
    state <= 4'b0000;
    end
    
    always @(negedge clk)
    begin 
    if(reset)
    begin
        IorD <= 1'b0;
        memRead <= 1'b0;
        IRWrite <= 1'b0;
        regDest <= 1'b0;
        aluSrcA <= 1'b0;
        aluSrcB <= 2'b00;
        aluOp <= 2'b00;
        hiWrite <= 1'b0;
        loWrite <= 1'b0;
        memToReg <= 2'b00;
        pcSrc <= 2'b00;
        pcWrite <= 1'b0;
        branch <= 1'b0;
        state <= 4'b0000;
    end
    if(state == 4'b0000) 
    begin
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
        state <= 4'b0001;
    end
    else if(state == 4'b0001)
    begin
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
        state <= 4'b0010;
    end
    else if(state == 4'b0010)
    begin    
        if(opcode == 6'b001000)
        begin
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
            state <= 4'b0011;
        end
        if(opcode == 6'b011000)
        begin
            IorD<=1'b0;
            memRead<=1'b0;
                    IRWrite<=1'b0;
                    regDest<=1'b0;
                    regWrite<=1'b0;
                    aluSrcA<=1'b1;
                    aluSrcB<=2'b00;
                    aluOp<=2'b10;
                    hiWrite<=1'b0;
                    loWrite<=1'b0;
                    memToReg<=2'b00;
                    pcSrc<=2'b00;
                    pcWrite<=1'b0;
                    branch<=1'b0;
            state <= 4'b0100;
        end
        if(opcode == 6'b010000)
        begin
                    IorD<=1'b0;
                    memRead<=1'b0;
                    IRWrite<=1'b0;
                    regDest<=1'b1;
                    regWrite<=1'b1;
                    aluSrcA<=1'b0;
                    aluSrcB<=2'b00;
                    aluOp<=2'b00;
                    hiWrite<=1'b0;
                    loWrite<=1'b0;
                    memToReg<=2'b01;
                    pcSrc<=2'b00;
                    pcWrite<=1'b0;
                    branch<=1'b0;
            state <= 4'b0101;
        end
        if(opcode == 6'b100011)
        begin
                            IorD<=1'b0;
                    memRead<=1'b0;
                    IRWrite<=1'b0;
                    regDest<=1'b0;
                    regWrite<=1'b0;
                    aluSrcA<=1'b1;
                    aluSrcB<=2'b10;
                    aluOp<=2'b00;
                    hiWrite<=1'b0;
                    loWrite<=1'b0;
                    memToReg<=2'b00;
                    pcSrc<=2'b00;
                    pcWrite<=1'b0;
                    branch<=1'b0;
            state <= 4'b0110;
        end
        if(opcode == 6'b000010)
        begin
                            IorD<=1'b0;
                    memRead<=1'b0;
                    IRWrite<=1'b0;
                    regDest<=1'b0;
                    regWrite<=1'b0;
                    aluSrcA<=1'b0;
                    aluSrcB<=2'b00;
                    aluOp<=2'b00;
                    hiWrite<=1'b0;
                    loWrite<=1'b0;
                    memToReg<=2'b00;
                    pcSrc<=2'b01;
                    pcWrite<=1'b1;
                    branch<=1'b0;
            state <= 4'b0111;
        end
        if(opcode == 6'b000100)
        begin
                    IorD<=1'b0;
                    memRead<=1'b0;
                    IRWrite<=1'b0;
                    regDest<=1'b0;
                    regWrite<=1'b0;
                    aluSrcA<=1'b1;
                    aluSrcB<=2'b00;
                    aluOp<=2'b01;
                    hiWrite<=1'b0;
                    loWrite<=1'b0;
                    memToReg<=2'b00;
                    pcSrc<=2'b00;
                    pcWrite<=1'b0;
                    branch<=1'b1;
            state <= 4'b1000;
        end
    end
    
    else if(state == 4'b0011)
    begin
                         IorD<=1'b0;
                    memRead<=1'b0;
                    IRWrite<=1'b0;
                    regDest<=1'b0;
                    regWrite<=1'b1;
                    aluSrcA<=1'b0;
                    aluSrcB<=2'b00;
                    aluOp<=2'b00;
                    hiWrite<=1'b0;
                    loWrite<=1'b0;
                    memToReg<=2'b10;
                    pcSrc<=2'b00;
                    pcWrite<=1'b0;
                    branch<=1'b0;
        
        state <= 4'b1001;
    end
    else if(state == 4'b0100)
    begin
                        IorD<=1'b0;
                    memRead<=1'b0;
                    IRWrite<=1'b0;
                    regDest<=1'b0;
                    regWrite<=1'b0;
                    aluSrcA<=1'b0;
                    aluSrcB<=2'b00;
                    aluOp<=2'b00;
                    hiWrite<=1'b1;
                    loWrite<=1'b1;
                    memToReg<=2'b00;
                    pcSrc<=2'b00;
                    pcWrite<=1'b0;
                    branch<=1'b0;
       
        state <= 4'b1010;
    end
    else if(state == 4'b0101)
    begin
        
        state <= 4'b0001;IorD<=1'b0;
                    memRead<=1'b1;
                    IRWrite<=1'b1;
                    regDest<=1'b0;
                    regWrite<=1'b0;
                    aluSrcA<=1'b0;
                    aluSrcB<=2'b01;
                    aluOp<=2'b00;
                    hiWrite<=1'b0;
                    loWrite<=1'b0;
                    memToReg<=2'b00;
                    pcSrc<=2'b10;
                    pcWrite<=1'b1;
                    branch<=1'b0;
    end
    else if(state == 4'b0110)
    begin
                           IorD<=1'b1;
                    memRead<=1'b1;
                    IRWrite<=1'b0;
                    regDest<=1'b0;
                    regWrite<=1'b0;
                    aluSrcA<=1'b0;
                    aluSrcB<=2'b00;
                    aluOp<=2'b00;
                    hiWrite<=1'b0;
                    loWrite<=1'b0;
                    memToReg<=2'b00;
                    pcSrc<=2'b00;
                    pcWrite<=1'b0;
                    branch<=1'b0;
        state <= 4'b1011;
    end
    else if(state == 4'b0111)
    begin
                           IorD<=1'b0;
                    memRead=1'b1;
                    IRWrite=1'b1;
                    regDest=1'b0;
                    regWrite=1'b0;
                    aluSrcA=1'b0;
                    aluSrcB=2'b01;
                    aluOp=2'b00;
                    hiWrite=1'b0;
                    loWrite=1'b0;
                    memToReg=2'b00;
                    pcSrc=2'b10;
                    pcWrite=1'b1;
                    branch=1'b0;
        state <= 4'b0001;
    end
    else if(state == 4'b1000)
    begin
                            IorD<=1'b0;
                    memRead<=1'b1;
                    IRWrite<=1'b1;
                    regDest<=1'b0;
                    regWrite<=1'b0;
                    aluSrcA<=1'b0;
                    aluSrcB<=2'b01;
                    aluOp<=2'b00;
                    hiWrite<=1'b0;
                    loWrite<=1'b0;
                    memToReg<=2'b00;
                    pcSrc<=2'b10;
                    pcWrite<=1'b1;
                    branch<=1'b0;
        state <= 4'b0001;
    end
    else if(state == 4'b1001)
    begin
                           IorD<=1'b0;
                    memRead<=1'b1;
                    IRWrite<=1'b1;
                    regDest<=1'b0;
                    regWrite<=1'b0;
                    aluSrcA<=1'b0;
                    aluSrcB<=2'b01;
                    aluOp<=2'b00;
                    hiWrite<=1'b0;
                    loWrite<=1'b0;
                    memToReg<=2'b00;
                    pcSrc<=2'b10;
                    pcWrite<=1'b1;
                    branch<=1'b0;
        state <= 4'b0001;
    end
    else if(state == 4'b1010)
    begin
                            IorD<=1'b0;
                    memRead<=1'b1;
                    IRWrite<=1'b1;
                    regDest<=1'b0;
                    regWrite<=1'b0;
                    aluSrcA<=1'b0;
                    aluSrcB<=2'b01;
                    aluOp<=2'b00;
                    hiWrite<=1'b0;
                    loWrite<=1'b0;
                    memToReg<=2'b00;
                    pcSrc<=2'b10;
                    pcWrite<=1'b1;
                    branch<=1'b0;
        state <= 4'b0001;
    end
    else if(state == 4'b1011)
    begin
                            IorD<=1'b0;
                    memRead<=1'b0;
                    IRWrite<=1'b0;
                    regDest<=1'b0;
                    regWrite<=1'b1;
                    aluSrcA<=1'b0;
                    aluSrcB<=2'b00;
                    aluOp<=2'b00;
                    hiWrite<=1'b0;
                    loWrite<=1'b0;
                    memToReg<=2'b00;
                    pcSrc<=2'b00;
                    pcWrite<=1'b0;
                    branch<=1'b0;
        state <= 4'b1100;
    end
    else if(state == 4'b1100)
    begin
                           IorD<=1'b0;
                    memRead<=1'b1;
                    IRWrite<=1'b1;
                    regDest<=1'b0;
                    regWrite<=1'b0;
                    aluSrcA<=1'b0;
                    aluSrcB<=2'b01;
                    aluOp<=2'b00;
                    hiWrite<=1'b0;
                    loWrite<=1'b0;
                    memToReg<=2'b00;
                    pcSrc<=2'b10;
                    pcWrite<=1'b1;
                    branch<=1'b0;
        state <= 4'b0001;
    end
    //end
 
 
 
    end
    
    // Write your code here
 
    // state must update on every negedge of clk
 
    // the outputs have to be assigned as per the value of state
 
endmodule