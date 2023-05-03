`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2023 10:53:07 PM
// Design Name: 
// Module Name: t_display_data_alu_flickinger
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module t_display_data_alu_flickinger();
    reg[3:0] t_user_msd, t_user_lsd;
    reg[11:0] t_ALU_output;
    reg[1:0] t_four_to_one_sel;
    reg t_alu_sign, t_input_sign, t_two_to_one_sel;
    wire t_a_out, t_b_out, t_c_out, t_d_out, t_e_out, t_f_out, t_g_out;
    wire[7:0] t_AN;
    
    display_data_output_circuit uut(t_user_msd, t_user_lsd, t_ALU_output, t_four_to_one_sel, t_alu_sign, t_input_sign, t_two_to_one_sel, t_a_out, t_b_out, t_c_out, t_d_out, t_e_out, t_f_out, t_g_out, t_AN);
    
    initial
        begin
            t_input_sign = 0;
            t_user_msd = 4'b0000;
            t_user_lsd = 4'b0000;        
            t_two_to_one_sel = 1;
          
            //0
            t_alu_sign = 0;
            t_ALU_output = 12'b000000000000; 
            t_four_to_one_sel = 2'b00;
            
            //1
            #50
            t_alu_sign = 0;
            t_ALU_output = 12'b000101001001;
            t_four_to_one_sel = 2'b01;
                        
            //2
            #50
            t_alu_sign = 0;
            t_ALU_output = 12'b001000011000;
            t_four_to_one_sel = 2'b10;
                        
            //3
            #50
            t_alu_sign = 0;
            t_ALU_output = 12'b001110000111;
            t_four_to_one_sel = 2'b11;
                        
            //4
            #50
            t_alu_sign = 1;
            t_ALU_output = 12'b010000100110; 
            t_four_to_one_sel = 2'b00;
            
            //5
            #50
            t_alu_sign = 1;
            t_ALU_output = 12'b010100000101; 
            t_four_to_one_sel = 2'b01;
                        
            //6
            #50
            t_alu_sign = 1;
            t_ALU_output = 12'b011001000100; 
            t_four_to_one_sel = 2'b10;
            
            //7
            #50
            t_alu_sign = 1;
            t_ALU_output = 12'b011110000011;
            t_four_to_one_sel = 2'b11;
            
            //8
            #50
            t_alu_sign = 0;
            t_ALU_output = 12'b100000100010; 
            t_four_to_one_sel = 2'b00;
            
            //9
            #50
            t_alu_sign = 0;
            t_ALU_output = 12'b100110010001; 
            t_four_to_one_sel = 2'b01;
        end
endmodule