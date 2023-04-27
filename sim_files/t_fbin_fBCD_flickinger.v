`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Flickinger
// Create Date: 04/26/2023 09:51:38 PM
// Design Name: 
// Module Name: t_fBCD_bin_flickinger
//////////////////////////////////////////////////////////////////////////////////


module t_fbin_fBCD_flickinger();
    reg [-1:-4] BINin;
    wire[3:0] BCDout;
    
    _fbin_fBCD uut(BINin[-1], BINin[-2], BINin[-3], BINin[-4], BCDout[3], BCDout[2], BCDout[1], BCDout[0]);
    
    initial
        begin
            BINin = 4'b0000;
            repeat(15)#50 BINin = BINin + 4'b0001;
        end
endmodule
