//////////////////////////////////////////////////////////////////////////////////
// Engineer: Ryan Flickinger
// Create Date: 04/26/2023 01:06:08 AM
// Design Name: 
// Module Name: fbin_fBCD_Flickinger
//////////////////////////////////////////////////////////////////////////////////


module _fbin_fBCD(
    input b1, b2, b3, b4,
    output a, b, c, d
    );
    
    //bx are binary input, a-d are bcd output
    assign a = b1 & b2;
    assign b = (b1 & ~b2) | (~b1 & b2 & b3);
    assign c = (~b1 & b2 & ~b3) | (b1 & ~b2 & b4) | (b1 & ~b2 & b3) | (~b2 & b3 & b4);
    assign d = (b1 & ~b2 & ~b3 & ~b4) | (~b1 & ~b2 & b3 & ~b4) | (~b1 & b2 & ~b3) | (~b1 & ~b3 & b4) | (b1 & b3 & b4) | (b1 & b2 & b3);
    
    
endmodule