`timescale 1ns / 1ps

module _ALU_addsub(
    input[7:0] A, B,
    input Add_Sub, sign_A, sign_B,
    output[8:0] magnitude,
    //output[7:0] Sum,
    output Final_sign
    //output ALB, AGB, AEB
    );
    wire[7:0] precorrectSum;
    wire ALB, AGB, AEB;
    
    wire eop, eop_sign;
    _EssOp_ID essential_op(Add_Sub, sign_A, sign_B, eop, eop_sign);    
    
    //This add_sub module does pure binary addition or 2s comp subtraction
    //Leaves negative nums in 2s comp form
    _8bitbinaddsub addsub( A[7:0], B[7:0], eop, precorrectSum[7:0], C_8);
    
    //This mag_com module compares the two 8 bit numbers to determine relative magnitude
    _8bitmagcom mag_com( A[7:0], B[7:0], 0, 0, 1, ALB, AGB, AEB);
    
    //corrects the output to proper syntax
    wire almost_sign;
    _Correcting corrector(Add_Sub, ALB, C_8, eop_sign, precorrectSum[7:0], almost_sign, magnitude);
    //assign Final_sign = almost_sign ^ eop_sign;
    //different assign statement suggested by someone else after I struggled with it for a while
    assign Final_sign = almost_sign & ~(eop & eop_sign & AEB);
    
endmodule
