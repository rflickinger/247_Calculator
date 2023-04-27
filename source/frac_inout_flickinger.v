`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Ryan Flickinger
// Create Date: 04/26/2023 01:06:08 AM
// Design Name: BCD to 7 seg
// Module Name: frac_inout_flickinger
//////////////////////////////////////////////////////////////////////////////////



module _frac_inout(
    input[3:0] bcd_in,
    output Seg_a, Seg_b, Seg_c, Seg_d, Seg_e, Seg_f, Seg_g,
    output[7:0] AN
    );
    wire b1,b2,b3,b4;
    wire[3:0] bcd_out;
    
    assign AN[7:0] = 8'b11111110;
    
    //convert input to binary
    _fBCD_fbin BCDGoingBin(bcd_in[3], bcd_in[2], bcd_in[1], bcd_in[0], b1, b2, b3, b4);
    //convert that binary back to bcd
    _fbin_fBCD BinGoingBCD(b1, b2, b3, b4, bcd_out[3], bcd_out[2], bcd_out[1], bcd_out[0]);
    //throw it out to the seven segment display
    _7448 SevenSeg(bcd_out[3], bcd_out[2], bcd_out[1], bcd_out[0], Seg_a, Seg_b, Seg_c, Seg_d, Seg_e, Seg_f, Seg_g);
    
endmodule
