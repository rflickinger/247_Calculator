`timescale 1ns / 1ps

module _Full_Adder(
    input A,B,Cin,
    output Co,S   
    );
    wire AexorBwire, AandBwire, Cinand_AexorBwire;
    
    xor AexorB(AexorBwire, A, B);
    and AandB(AandBwire, A, B);
    and Cinand_AexorB(Cinand_AexorBwire, Cin, AexorBwire);
    or AandB_or_Cinand_AexorB(Co, Cinand_AexorBwire, AandBwire);
    
    xor Cinexor_AandB(S, AexorBwire, Cin);
    
endmodule

module _7483(
    input[3:0] A,B,
    input C_0,
    output [3:0] S,
    output C_4
);
wire[3:1] C;

_Full_Adder FA0(A[0], B[0], C_0, C[1], S[0]);
_Full_Adder FA1(A[1], B[1], C[1], C[2], S[1]);
_Full_Adder FA2(A[2], B[2], C[2], C[3], S[2]);
_Full_Adder FA3(A[3], B[3], C[3], C_4, S[3]);

endmodule

module _8bitCompl(
    input[7:0] B,
    input Cin,
    output[7:0] Bout
);

xor xor0(Bout[0], B[0], Cin);
xor xor1(Bout[1], B[1], Cin);
xor xor2(Bout[2], B[2], Cin);
xor xor3(Bout[3], B[3], Cin);
xor xor4(Bout[4], B[4], Cin);
xor xor5(Bout[5], B[5], Cin);
xor xor6(Bout[6], B[6], Cin);
xor xor7(Bout[7], B[7], Cin);

endmodule


module _8bitbinaddsub(
    input[7:0] A,B,
    input C_0,
    output[7:0] S,
    output C_8
);
wire[7:0] Bout;
wire C_4;

_8bitCompl comp(B, C_0, Bout);
_7483 least_adder(A[3:0], Bout[3:0], C_0, S[3:0], C_4);
_7483 most_adder (A[7:4], Bout[7:4], C_4, S[7:4], C_8);


endmodule