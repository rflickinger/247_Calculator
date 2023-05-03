`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: 
// Create Date: 05/02/2023 07:39:01 PM
// Module Name: counter_Flickinger
// Description: 
//////////////////////////////////////////////////////////////////////////////////


module counter(
    input clck, reste,
    output[1:0] count
    );
    wire Q_b_lsb, Q_b_msb;
    
    _DFF lsb(Q_b_lsb, clck, reste, count[0], Q_b_lsb);
    _DFF msb(Q_b_msb, clck, reste, count[1], Q_b_msb);
    
endmodule
