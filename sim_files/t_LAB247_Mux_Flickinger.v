`timescale 1ns / 1ps
/*
module t_2to1mux;
    reg [3:0] D1, D2;
    reg G1, G2, A, B;
    wire Y1,Y2;
        
    _74153 mux1(D1, D2, G1, G2, A, B, Y1, Y2);
    
    initial
    begin
    #0
    G1 = 0; G2 = 1;
    D1[3]=0; D1[2]=1; D1[1]=0; D1[0]=1;
    D2[3]=1; D2[2]=0; D2[1]=1; D2[0]=0;
    A = 0; B = 0;
    
    #50 A = 1; B = 0;
    #50 A = 0; B = 1;
    #50 A = 1; B = 1;
    
    end
    initial #200 $finish;

endmodule
*/

module t_8bitmux;
    reg [7:0] D;
    reg [2:0] S;
    wire Y;
        
    _8bitmux mux1(D, S, Y);
    
    initial
    begin
    #0
    S = 000;
    D[7] = 1; D[6] = 1; D[5] = 1; D[4] = 1; D[3] = 0; D[2] = 1; D[1] = 0; D[0] = 1;
    
    #50 S = 001;
    #50 S = 010;
    #50 S = 011;
    #50 S = 100;
    #50 S = 101;
    #50 S = 110;
    #50 S = 111;
    
    end
    initial #400 $finish;

endmodule