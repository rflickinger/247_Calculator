`timescale 1ns / 1ps

module _EssOp_ID(
    input Add_Sub, sign_A, sign_B,
    output EOP, EOP_Sign
    );
    
    wire eopWire;
    xor eopXor1(eopWire, Add_Sub, sign_B);
    xor eopXor2(EOP, sign_A, eopWire);
    assign EOP_Sign = sign_A;
    
endmodule
