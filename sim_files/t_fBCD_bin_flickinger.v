`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Flickinger
// Create Date: 04/26/2023 09:51:38 PM
// Design Name: 
// Module Name: t_fBCD_bin_flickinger
//////////////////////////////////////////////////////////////////////////////////


module t_fBCD_bin_flickinger();
    reg [3:0] BCDin;
    wire[-1:-4] BINout;
    
    _fBCD_fbin uut(BCDin[3], BCDin[2], BCDin[1], BCDin[0], BINout[-1], BINout[-2], BINout[-3], BINout[-4]);
    
    initial
        begin
            BCDin = 4'b0000;
            repeat(9)#100 BCDin = BCDin + 4'b0001;
        end
endmodule
