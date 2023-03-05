`timescale 1ns / 1ps

module _ALU_addsub(
    input[7:0] A, B,
    input Add_Sub, //sign_A, sign_B,
    output[7:0] Sum,
    output C_8, ALB, AGB, AEB//, Final_sign
    );
    //This add_sub module does pure binary addition or 2s comp subtraction
    //Leaves negative nums in 2s comp form

    _8bitbinaddsub addsub( A[7:0], B[7:0], Add_Sub, Sum[7:0], C_8);
    
    //This mag_com module compares the two 8 bit numbers to determine relative magnitude
    _8bitmagcom mag_com( A[7:0], B[7:0], 0, 0, 1, ALB, AGB, AEB);
    

    
endmodule
