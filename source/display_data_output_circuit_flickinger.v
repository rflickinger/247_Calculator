`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Ryan Flickinger
// Create Date: 04/27/2023 10:41:50 AM
// Description: Takes data from the ALU to the 7 Segment display
// Module Name: display_data_output_circuit_flickinger
//////////////////////////////////////////////////////////////////////////////////


module display_data_output_circuit(
    input[3:0] ab_msd, ab_lsd,
    input[11:0] alu_out,
    input[1:0] four_to_one_sel,
    input alu_sign, input_sign, two_to_one_sel, 
    output a_out, b_out, c_out, d_out, e_out, f_out, g_out,
    output[7:0] AN
    );
    wire[11:0] input_full_BCD;
    
    assign input_full_BCD[11:8] = 4'b0000;
    assign input_full_BCD[7:4] = ab_msd;
    assign input_full_BCD[3:0] = ab_lsd;
    
    
    //C vector: 0 is input, 1 is alu output
    wire[1:0] sign, C11, C10, C9, C8, C7, C6, C5, C4, C3, C2, C1, C0;
    assign sign[0] = input_sign;
    assign sign[1] = alu_sign;
    assign C11[0] = input_full_BCD[11];
    assign C11[1] = alu_out[11];
    assign C10[0] = input_full_BCD[10];
    assign C10[1] = alu_out[10];
    assign C9[0] = input_full_BCD[9];
    assign C9[1] = alu_out[9];
    assign C8[0] = input_full_BCD[8];
    assign C8[1] = alu_out[8];
    assign C7[0] = input_full_BCD[7];
    assign C7[1] = alu_out[7];
    assign C6[0] = input_full_BCD[6];
    assign C6[1] = alu_out[6];
    assign C5[0] = input_full_BCD[5];
    assign C5[1] = alu_out[5];
    assign C4[0] = input_full_BCD[4];
    assign C4[1] = alu_out[4];
    assign C3[0] = input_full_BCD[3];
    assign C3[1] = alu_out[3];
    assign C2[0] = input_full_BCD[2];
    assign C2[1] = alu_out[2];
    assign C1[0] = input_full_BCD[1];
    assign C1[1] = alu_out[1];
    assign C0[0] = input_full_BCD[0];
    assign C0[1] = alu_out[0];
    
    // holds the sign output by the 2 to 1 mux
    wire out_sign;
    
    //holds the BCD output by the 2 to 1 muxes
    wire msb_a, msb_b, msb_c, msb_d, sb_a, sb_b, sb_c, sb_d, lsb_a, lsb_b, lsb_c, lsb_d;
    
    //13 2:1 mux, first is the sign mux
    _2to1mux _2_mux_sign(sign, two_to_one_sel, out_sign);
    
    //msb muxes
    _2to1mux _2_mux_11(C11, two_to_one_sel, msb_a);
    _2to1mux _2_mux_10(C10, two_to_one_sel, msb_b);
    _2to1mux _2_mux_9(C9, two_to_one_sel, msb_c);
    _2to1mux _2_mux_8(C8, two_to_one_sel, msb_d);
    
    //sb muxes
    _2to1mux _2_mux_7(C7, two_to_one_sel, sb_a);
    _2to1mux _2_mux_6(C6, two_to_one_sel, sb_b);
    _2to1mux _2_mux_5(C5, two_to_one_sel, sb_c);
    _2to1mux _2_mux_4(C4, two_to_one_sel, sb_d);
    
    //lsb_muxes
    _2to1mux _2_mux_3(C3, two_to_one_sel, lsb_a);
    _2to1mux _2_mux_2(C2, two_to_one_sel, lsb_b);
    _2to1mux _2_mux_1(C1, two_to_one_sel, lsb_c);
    _2to1mux _2_mux_0(C0, two_to_one_sel, lsb_d);
    
    
    //bcd to 7 seg decoder farm
    //wires to hold values from each decoder, 6 is a, 0 is g
    wire[6:0] msb_seg, sb_seg, lsb_seg;
    
    _7448 _7seg_msb(msb_a, msb_b, msb_c, msb_d, msb_seg[6], msb_seg[5], msb_seg[4], msb_seg[3], msb_seg[2], msb_seg[1], msb_seg[0]);
    _7448 _7seg_sb (sb_a,  sb_b,  sb_c,  sb_d,  sb_seg[6],  sb_seg[5],  sb_seg[4],  sb_seg[3],  sb_seg[2],  sb_seg[1],  sb_seg[0]);
    _7448 _7seg_lsb(lsb_a, lsb_b, lsb_c, lsb_d, lsb_seg[6], lsb_seg[5], lsb_seg[4], lsb_seg[3], lsb_seg[2], lsb_seg[1], lsb_seg[0]);
    
    //wires to put each of the segments into a vector
    //0 is sign, 1 is msb, 2 is sb, 3 is lsb
    //h is a dump vector for the last one
    wire[3:0] a_vect, b_vect, c_vect, d_vect, e_vect, f_vect, g_vect, h_vect;
    assign a_vect[0] = 1;
    assign a_vect[1] = msb_seg[6];
    assign a_vect[2] = sb_seg[6];
    assign a_vect[3] = lsb_seg[6];
    
    assign b_vect[0] = 1;
    assign b_vect[1] = msb_seg[5];
    assign b_vect[2] = sb_seg[5];
    assign b_vect[3] = lsb_seg[5];
    
    assign c_vect[0] = 1;
    assign c_vect[1] = msb_seg[4];
    assign c_vect[2] = sb_seg[4];
    assign c_vect[3] = lsb_seg[4];
    
    assign d_vect[0] = 1;
    assign d_vect[1] = msb_seg[3];
    assign d_vect[2] = sb_seg[3];
    assign d_vect[3] = lsb_seg[3];
    
    assign e_vect[0] = 1;
    assign e_vect[1] = msb_seg[2];
    assign e_vect[2] = sb_seg[2];
    assign e_vect[3] = lsb_seg[2];
    
    assign f_vect[0] = 1;
    assign f_vect[1] = msb_seg[1];
    assign f_vect[2] = sb_seg[1];
    assign f_vect[3] = lsb_seg[1];
    
    assign g_vect[0] = ~out_sign; //THIS IS SET TO NOT ON PURPOSE. RESULTS WILL BE REVERSED ON SIM
    assign g_vect[1] = msb_seg[0];
    assign g_vect[2] = sb_seg[0];
    assign g_vect[3] = lsb_seg[0];
    
    assign h_vect[0] = 0;
    assign h_vect[1] = 0;
    assign h_vect[2] = 0;
    assign h_vect[3] = 0;
    
    //four to one muxes, where the magic happens
    //actually 4 dual four to ones, the last one is nuked.
    //dump wires for input and output on the last mux
    //[0,0] selects sign
    //[0,1] selects msb
    //[1,0] selects sb
    //[1,1] selects lsb
    wire h_out;
    _74153 _four_mux_ab(a_vect, b_vect, 0, 0, four_to_one_sel[0], four_to_one_sel[1], a_out, b_out);
    _74153 _four_mux_cd(c_vect, d_vect, 0, 0, four_to_one_sel[0], four_to_one_sel[1], c_out, d_out);
    _74153 _four_mux_ef(e_vect, f_vect, 0, 0, four_to_one_sel[0], four_to_one_sel[1], e_out, f_out);
    _74153 _four_mux_gh(g_vect, h_vect, 0, 0, four_to_one_sel[0], four_to_one_sel[1], g_out, h_out);
    
    //NEED WAY TO SELECT THE PROPER ANODE ALONG WITH IT
    wire[3:0] an_3, an_2, an_1, an_0;
    assign an_3[3:0] = 4'b0001;
    assign an_2[3:0] = 4'b0010;
    assign an_1[3:0] = 4'b0100;
    assign an_0[3:0] = 4'b1000;
    
    _74153 _four_mux_an32(an_3, an_2, 0, 0, four_to_one_sel[0], four_to_one_sel[1], AN[3], AN[2]);
    _74153 _four_mux_an10(an_1, an_0, 0, 0, four_to_one_sel[0], four_to_one_sel[1], AN[1], AN[0]);
    
    assign AN[7:4] = 4'b0000;
endmodule