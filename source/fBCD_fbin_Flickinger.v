//////////////////////////////////////////////////////////////////////////////////
// Engineer: Ryan Flickinger
// Create Date: 04/26/2023 01:06:08 AM
// Design Name: 
// Module Name: fBCD_fbin_Flickinger
//////////////////////////////////////////////////////////////////////////////////


module _fBCD_fbin(
    input a, b, c, d,
    output b1, b2, b3, b4
    );
    
    //bx is the binary (num after decimal) output, a-d is bcd input
    assign b1 = a | (b & (c | d));
    assign b2 = a | (b & ~c & ~d) | (~b & c & d);
    assign b3 = (b & ~c & ~d) | (b & c & d) | (a & d) | (~b & c & ~d);
    assign b4 = (~b & ~c & d) | (~b & c & ~d) | a | (b & c);
    
endmodule