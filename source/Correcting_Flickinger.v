`timescale 1ns / 1ps

module _Correcting(
    input Add_Sub, ALB, C_8, eop_sign,
    input[7:0] Sum,
    output almost_sign,
    output[8:0] magnitude
    );
    wire C8DP, SumCP, correctedC_8, correctedSumWire; 
    
    //sign from the original corrector
    wire sign;
    assign sign = Add_Sub && ALB;
    
    //pass or zero out C_8. 1 means zero out C_8
    assign C8DP = Add_Sub;
    assign correctedC_8 = ~C8DP && C_8;
    assign magnitude[8] = correctedC_8;
    
    // pass or complement sum
    assign SumCP = Add_Sub && ALB;
    wire[7:0] zeroHolder;
    wire discardWire;
    assign zeroHolder[7:0]  = 00000000;
    _8bitbinaddsub corrector(zeroHolder, Sum, SumCP, magnitude[7:0], discardWire);
 
    assign almost_sign = sign ^ eop_sign;
endmodule
