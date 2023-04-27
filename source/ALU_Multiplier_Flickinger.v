`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Ryan Flickinger
// Create Date: 04/25/2023 08:53:50 PM
// Module Name: ALU_Multiplier_Flickinger
// Project Name: 247 Calculator
//////////////////////////////////////////////////////////////////////////////////


module _4x4_mult(
    input[3:0] A, B,
    output [7:0] prod
    );
    wire[15:0] and_holder;
    //anded pairs for A[3->0] and B[1,0]
    assign prod[0] = A[0] & B[0];
    for(genvar j = 0; j < 4; j = j + 1) begin
         for(genvar i = 0; i < 4; i = i + 1) begin
            assign and_holder[i+j*4] = A[i] & B[j]; 
         end
    end
    
    wire[3:0] b_0, b_1, b_2, b_3;
    
    assign b_0[3] = 0;
    assign b_0[2:0] = and_holder[3:1];
    assign b_1[3:0] = and_holder[7:4]; 
    assign b_2[3:0] = and_holder[11:8];
    assign b_3[3:0] = and_holder[15:12];
    
    wire[6:3] sum;
    wire[5:1] Q;
    wire[6:2] R;
    
    _7483 add1(b_0, b_1, 0, Q[4:1], Q[5]);
    _7483 add2(b_2, Q[5:2], 0, R[5:2], R[6]); 
    _7483 add3(b_3, R[6:3], 0, sum, prod[7]);
    
    assign prod[0] = and_holder[0];
    assign prod[1] = Q[1];
    assign prod[2] = R[2];
    assign prod[6:3] = sum[6:3];
    
    
endmodule

module _ALU_multiplier(
    input[7:0] A, B,
    input sign_A, sign_B,
    output[15:0] P,
    output Final_sign
    );
    wire[7:0] T,U,V,W;
    wire[7:0] UVSum, TUVSum;
    wire C1, C2, C3;
    
    _4x4_mult mult0(A[3:0], B[3:0], T);
    _4x4_mult mult1(A[7:4], B[3:0], U);
    _4x4_mult mult2(A[3:0], B[7:4], V);
    _4x4_mult mult3(A[7:4], B[7:4], W);
    
    _8bitbinaddsub as1(U, V, 0, UVSum, C1);
    wire[7:0] tempA;
    assign tempA[7:4] = 4'b0000;
    assign tempA[3:0] = T[7:4];
    
    _8bitbinaddsub as2(tempA, UVSum, 0, TUVSum, C2);
    wire[7:0] tempB;
    assign tempB[7:5] = 3'b000;
    assign tempB[4] = C1;
    assign tempB[3:0] = TUVSum[7:4];
    
    _8bitbinaddsub as3(tempB, W, 0, P[15:8], C3);
    
    assign P[3:0] = T[3:0];
    assign P[7:4] = TUVSum[3:0];
    
    assign Final_sign = sign_A ^ sign_B;
    
endmodule