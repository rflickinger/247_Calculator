`timescale 1ns / 1ps

// From Texas Instruments SN54S85 datasheet
module _7485(
    input [3:0] A,B,
    input alb, agb, aeb,
    output ALB, AGB, AEB
);
         // bottom-level nands
    wire a0NandB0, a1NandB1, a2NandB2, a3NandB3,
         
         //format: inputAnd<already made nand gate>
         a0AndNand0, b0AndNand0, a1AndNand1, b1AndNand1,
         a2AndNand2, b2AndNand2, a3AndNand3, b3AndNand3,
     
         //Nors for each digit
         Nor0, Nor1, Nor2, Nor3,

         // Nands are numbered lowest to highest from bottom to
         // top of datasheet. Second to last column of gates.
         endNand1, endNand2, endNand3, endNand4, endNand5, endNand6,
         endNand7, endNand8, endNand9, endNand10, endNand11, endNand12;
    
    assign a0NandB0 = !(A[0] && B[0]); 
    assign a1NandB1 = !(A[1] && B[1]); 
    assign a2NandB2 = !(A[2] && B[2]); 
    assign a3NandB3 = !(A[3] && B[3]); 
    
    assign a0AndNand0 = A[0] && a0NandB0;
    assign a1AndNand1 = A[1] && a1NandB1;
    assign a2AndNand2 = A[2] && a2NandB2;
    assign a3AndNand3 = A[3] && a3NandB3;
    assign b0AndNand0 = B[0] && a0NandB0;
    assign b1AndNand1 = B[1] && a1NandB1;
    assign b2AndNand2 = B[2] && a2NandB2;
    assign b3AndNand3 = B[3] && a3NandB3;
    
    assign Nor0 = !(a0AndNand0 || b0AndNand0);
    assign Nor1 = !(a1AndNand1 || b1AndNand1);
    assign Nor2 = !(a2AndNand2 || b2AndNand2);
    assign Nor3 = !(a3AndNand3 || b3AndNand3);
    
    assign endNand1  = !(A[3] && a3NandB3);
    assign endNand2  = !(A[2] && a2NandB2 && Nor3);
    assign endNand3  = !(A[1] && a1NandB1 && Nor3 && Nor2);
    assign endNand4  = !(A[0] && a0NandB0 && Nor3 && Nor2 && Nor1);
    assign endNand5  = !(agb && Nor3 && Nor2 && Nor1 && Nor0);
    assign endNand6  = !(aeb && Nor3 && Nor2 && Nor1 && Nor0);
    assign endNand7  = !(aeb && Nor3 && Nor2 && Nor1 && Nor0);
    assign endNand8  = !(alb && Nor3 && Nor2 && Nor1 && Nor0);
    assign endNand9  = !(B[0] && a0NandB0 && Nor3 && Nor2 && Nor1);
    assign endNand10 = !(B[1] && a1NandB1 && Nor3 && Nor2);
    assign endNand11 = !(B[2] && a2NandB2 && Nor3);
    assign endNand12 = !(B[3] && a3NandB3);
    
    assign ALB = endNand1 && endNand2 && endNand3 && endNand4 && endNand5 && endNand6;
    assign AGB = endNand7 && endNand8 && endNand9 && endNand10 && endNand11 && endNand12;
    assign AEB = aeb && Nor3 && Nor2 && Nor1 && Nor0;
    
endmodule