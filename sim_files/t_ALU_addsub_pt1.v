`timescale 1ns / 1ps

module t_ALU_addsub_pt1();
    reg[7:0] A,B;
    reg Add_Sub;
    wire[7:0] Sum;
    wire ALB, AGB, AEB, C_8;
   
    _ALU_addsub myaddsub(A[7:0], B[7:0], Add_Sub, Sum[7:0], C_8, ALB, AGB, AEB);
    
    initial
        begin
            A = 8'b00111111;
            B = 8'b00111110;
            Add_Sub = 1'b0;
            #100 Add_Sub = Add_Sub + 1'b1;
            #100 B = B + 8'b00000001;
            Add_Sub = Add_Sub + 1'b1;
            #100 Add_Sub = Add_Sub + 1'b1;
            #100 B = B + 8'b00000001;
            Add_Sub = Add_Sub + 1'b1;
            #100 Add_Sub = Add_Sub + 1'b1;
            #100 B = B + 8'b00000001;
            Add_Sub = Add_Sub + 1'b1;
            #100 Add_Sub = Add_Sub + 1'b1;
            #100 B = B + 8'b00000001;
            Add_Sub = Add_Sub + 1'b1;
            #100 Add_Sub = Add_Sub + 1'b1;
            #100 B = B + 8'b00000001;
            Add_Sub = Add_Sub + 1'b1;
       end
    initial #1000 $finish;
endmodule
