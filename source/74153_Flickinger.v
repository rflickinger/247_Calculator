`timescale 1ns / 1ps
//Ryan Flickinger

//Basic 2 to 1 mux using Dataflow
module _2to1mux(
    input [1:0] C,
    input A,
    output Y
);
    
    assign Y  = (A)?C[1]:C[2];
    
endmodule

//Dual 4 to 1 mux using Dataflow
module _74153(
    input[3:0] D1,D2,
    input G1,G2,
    input A,B,
    output Y1,Y2
); 
    wire[3:0] C1, C2;
    wire aNot, aNotNot, bNot, bNotNot, g1Not, g2Not;
    
    //Set all NOT wires
    assign aNot = ~A;
    assign aNotNot = ~aNot;
    assign bNot = ~B;
    assign bNotNot = ~bNot;
    assign g1Not = ~G1;
    assign g2Not = ~G2;
    
    //first mux individual outputs
    assign C1[0]  = g1Not & bNot & aNot & D1[0];
    assign C1[1]  = g1Not & bNot & aNotNot & D1[1];
    assign C1[2]  = g1Not & bNotNot & aNot & D1[2];
    assign C1[3]  = g1Not & bNotNot & aNotNot & D1[3];
    
    //first mux output
    assign Y1 = C1[3] | C1[2] | C1[1] | C1[0];
    
    //second mux individual outputs
    assign C2[0]  = g2Not & bNot & aNot & D2[0];
    assign C2[1]  = g2Not & bNot & aNotNot & D2[1];
    assign C2[2]  = g2Not & bNotNot & aNot & D2[2];
    assign C2[3]  = g2Not & bNotNot & aNotNot & D2[3];
    
    //Second mux output
    assign Y2 = C2[3] | C2[2] | C2[1] | C2[0];
    
    
endmodule

// 8 to 1 multiplexor
module _8bitmux(
    input[7:0] D,
    input[2:0] S,
    output Y
);
    //wires for enable input and both ouputs
    wire S2Not, Y1, Y2;
    
    // S2Not will always be opposite of S2, so only one mux can be enabled
    assign S2Not = ~S[2];
    
    //Run data through 74153 module
    _74153 _my8BitMux( D[3:0], D[7:4], S[2], S2Not, S[0], S[1], Y1, Y2);
    
    // assign value from both outputs to singular Y output
    assign Y = Y1 | Y2;  

endmodule