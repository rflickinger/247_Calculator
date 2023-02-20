`timescale 1ns / 1ps
module t_7485_Flickinger();
    
    reg[4:0] A,B;
    wire ALB, AGB, AEB;
    
    _7485 mag_com(A, B, 0, 0, 1, ALB, AGB, AEB);
    
    initial
        begin
            A = 4'b1000;
            B = 4'b0110;
            repeat(4)#50 B = B + 4'b0001;
        end
endmodule
