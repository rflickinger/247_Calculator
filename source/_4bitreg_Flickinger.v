`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Design source: Digital Design, Mano and Ciletti (p276)
// Engineer: Ryan Flickinger
// Create Date: 05/02/2023 06:18:21 PM
// Module Name: _4bitreg_Flickinger
// Description: 
//////////////////////////////////////////////////////////////////////////////////

module _4bitreg_Flickinger(
    input clck, reste,
    input[3:0] I,
    output[3:0] A
    );
    wire[3:0] dump;
    
    _DFF dff0(I[0], clck, reste, A[0], dump[0]);
    _DFF dff1(I[1], clck, reste, A[1], dump[1]);
    _DFF dff2(I[2], clck, reste, A[2], dump[2]);
    _DFF dff3(I[3], clck, reste, A[3], dump[3]);
    
endmodule
