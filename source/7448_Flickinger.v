`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Ryan Flickinger
// Create Date: 04/26/2023 01:06:08 AM
// Design Name: BCD to 7 seg
// Module Name: 7448_Flickinger
//////////////////////////////////////////////////////////////////////////////////


module _7448 (
    input A,B,C,D,
    output a,b,c,d,e,f,g
    );
    
    //lowercase are segments, upper are inputs
    assign a = ~(A | (~A & C) | (~C & ~(B ^ D)));
    assign b = ~(A | (~A & ~B) | ~(C ^ D));
    assign c = ~(B | ~C | (C & D));
    assign d = ~(A | (~A & ~B & ~D) | (~B & C) | (B & ~C & D) | (C & ~D));
    assign e = ~(~D & (C | (~B &~C)));
    assign f = ~(A | (~C & ~D) | (B & (~C | ~D)));
    assign g = ~(A | (C & ~D) | (B ^ C));

endmodule
