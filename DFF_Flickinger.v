`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Design source: Digital Design, Mano and Ciletti (p276)
// Engineer: Ryan Flickinger
// Create Date: 05/02/2023 05:19:20 PM
// Module Name: DFF_Flickinger 
// Description: 
//////////////////////////////////////////////////////////////////////////////////


module _DFF(
    input D, clck, reste,
    output Q, Q_b
    );
    //top nand is 3, bottom is 0
    wire [3:0] _nand;
    
    assign _nand[3] = ~(_nand[0] & _nand[2]);
    assign _nand[2] = ~(_nand[3] & clck & ~reste);
    assign _nand[1] = ~(_nand[2] & clck & _nand[0]);
    assign _nand[0] = ~(_nand[1] & D & ~reste);
    
    assign Q = ~(_nand[2] & Q_b);
    assign Q_b = ~(_nand[1] & Q & ~reste);
    
endmodule
