`timescale 1ns / 1ps

// From Texas Instruments SN54S85 datasheet
module _7485(
    input [3:0] A,B,
    input alb, agb, aeb,
    output ALB, AGB, AEB
);
   
              // bottom-level nands
    wire[3:0] aNandB,
    
              //format: inputAnd<already made nand gate>
              aAndNand, bAndNand,
              
              //Nors for each digit
              Nor;
              
               // Nands are numbered lowest to highest from bottom to
               // top of datasheet. Second to last column of gates.
    wire[12:1] endNand;
        
    assign aNandB[0] = !(A[0] && B[0]); 
    assign aNandB[1] = !(A[1] && B[1]); 
    assign aNandB[2] = !(A[2] && B[2]); 
    assign aNandB[3] = !(A[3] && B[3]); 
    
    assign aAndNand[0] = A[0] && aNandB[0];
    assign aAndNand[1] = A[1] && aNandB[1];
    assign aAndNand[2] = A[2] && aNandB[2];
    assign aAndNand[3] = A[3] && aNandB[3];
    assign bAndNand[0] = B[0] && aNandB[0];
    assign bAndNand[1] = B[1] && aNandB[1];
    assign bAndNand[2] = B[2] && aNandB[2];
    assign bAndNand[3] = B[3] && aNandB[3];
    
    assign Nor[0] = !(aAndNand[0] || bAndNand[0]);
    assign Nor[1] = !(aAndNand[1] || bAndNand[1]);
    assign Nor[2] = !(aAndNand[2] || bAndNand[2]);
    assign Nor[3] = !(aAndNand[3] || bAndNand[3]);
    
    assign endNand[1]  = !(A[3] && aNandB[3]);
    assign endNand[2]  = !(A[2] && aNandB[2] && Nor[3]);
    assign endNand[3]  = !(A[1] && aNandB[1] && Nor[3] && Nor[2]);
    assign endNand[4]  = !(A[0] && aNandB[0] && Nor[3] && Nor[2] && Nor[1]);
    assign endNand[5]  = !(agb && Nor[3] && Nor[2] && Nor[1] && Nor[0]);
    assign endNand[6]  = !(aeb && Nor[3] && Nor[2] && Nor[1] && Nor[0]);
    assign endNand[7]  = !(aeb && Nor[3] && Nor[2] && Nor[1] && Nor[0]);
    assign endNand[8]  = !(alb && Nor[3] && Nor[2] && Nor[1] && Nor[0]);
    assign endNand[9]  = !(B[0] && aNandB[0] && Nor[3] && Nor[2] && Nor[1]);
    assign endNand[10] = !(B[1] && aNandB[1] && Nor[3] && Nor[2]);
    assign endNand[11] = !(B[2] && aNandB[2] && Nor[3]);
    assign endNand[12] = !(B[3] && aNandB[3]);
    
    assign ALB = endNand[1] && endNand[2] && endNand[3] && endNand[4] && endNand[5] && endNand[6];
    assign AGB = endNand[7] && endNand[8] && endNand[9] && endNand[10] && endNand[11] && endNand[12];
    assign AEB = aeb && Nor[3] && Nor[2] && Nor[1] && Nor[0];
    
endmodule

module _8bitmagcom(
    input[7:0] A,B,
    input alb, agb, aeb,
    output ALB, AGB, AEB
);
wire least_ALB, least_AGB, least_AEB;

_7485 least_sig(A[3:0], B[3:0], alb, agb, aeb, least_ALB, least_AGB, least_AEB);
_7485 most_sig(A[7:4], B[7:4], least_ALB, least_AGB, least_AEB, ALB, AGB, AEB);  

endmodule