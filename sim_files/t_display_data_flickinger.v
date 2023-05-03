`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// Engineer: 
// Create Date: 04/27/2023 05:33:26 PM
// Module Name: t_display_data_flickinger
//////////////////////////////////////////////////////////////////////////////////


module t_display_data_flickinger();
    reg[3:0] t_user_msd, t_user_lsd;
    reg[11:0] t_ALU_output;
    reg[1:0] t_four_to_one_sel;
    reg t_alu_sign, t_input_sign, t_two_to_one_sel;
    wire t_a_out, t_b_out, t_c_out, t_d_out, t_e_out, t_f_out, t_g_out;
    wire[7:0] t_AN;
    
    display_data_output_circuit uut(t_user_msd, t_user_lsd, t_ALU_output, t_four_to_one_sel, t_alu_sign, t_input_sign, t_two_to_one_sel, t_a_out, t_b_out, t_c_out, t_d_out, t_e_out, t_f_out, t_g_out, t_AN);
    
    initial
        begin
            t_alu_sign = 0;
            t_ALU_output = 12'b000000000000;        
            t_two_to_one_sel = 0;
          
            //0
            t_input_sign = 0;
            t_user_msd = 4'b0000;
            t_user_lsd = 4'b1001; 
            t_four_to_one_sel = 2'b00;
            
            //1
            #50
            t_input_sign = 0;
            t_user_msd = 4'b0000;
            t_user_lsd = 4'b1001; 
            t_four_to_one_sel = 2'b01;
                        
            //2
            #50
            t_input_sign = 0;
            t_user_msd = 4'b0001;
            t_user_lsd = 4'b1000; 
            t_four_to_one_sel = 2'b10;
                        
            //3
            #50
            t_input_sign = 0;
            t_user_msd = 4'b0001;
            t_user_lsd = 4'b1000; 
            t_four_to_one_sel = 2'b11;
                        
            //4
            #50
            t_input_sign = 0;
            t_user_msd = 4'b0010;
            t_user_lsd = 4'b0111; 
            t_four_to_one_sel = 2'b00;
            
            //5
            #50
            t_input_sign = 0;
            t_user_msd = 4'b0010;
            t_user_lsd = 4'b0111; 
            t_four_to_one_sel = 2'b01;
                        
            //6
            #50
            t_input_sign = 0;
            t_user_msd = 4'b0011;
            t_user_lsd = 4'b0110; 
            t_four_to_one_sel = 2'b10;
            
            //7
            #50
            t_input_sign = 0;
            t_user_msd = 4'b0011;
            t_user_lsd = 4'b0110; 
            t_four_to_one_sel = 2'b11;
            
            //8
            #50
            t_input_sign = 1;
            t_user_msd = 4'b0100;
            t_user_lsd = 4'b0101; 
            t_four_to_one_sel = 2'b00;
            
            //9
            #50
            t_input_sign = 1;
            t_user_msd = 4'b0100;
            t_user_lsd = 4'b0101; 
            t_four_to_one_sel = 2'b01;
            
            //10
            #50
            t_input_sign = 1;
            t_user_msd = 4'b0101;
            t_user_lsd = 4'b0100; 
            t_four_to_one_sel = 2'b10;
            
            //11
            #50
            t_input_sign = 1;
            t_user_msd = 4'b0101;
            t_user_lsd = 4'b0100; 
            t_four_to_one_sel = 2'b11;
                        
            //12
            #50
            t_input_sign = 1;
            t_user_msd = 4'b0110;
            t_user_lsd = 4'b0011; 
            t_four_to_one_sel = 2'b00;
                        
            //13
            #50
            t_input_sign = 1;
            t_user_msd = 4'b0110;
            t_user_lsd = 4'b0011; 
            t_four_to_one_sel = 2'b01;
                        
            //14
            #50
            t_input_sign = 1;
            t_user_msd = 4'b0111;
            t_user_lsd = 4'b0010; 
            t_four_to_one_sel = 2'b10;
            
            //15
            #50
            t_input_sign = 1;
            t_user_msd = 4'b0111;
            t_user_lsd = 4'b0010; 
            t_four_to_one_sel = 2'b11;
                        
            //16
            #50
            t_input_sign = 0;
            t_user_msd = 4'b1000;
            t_user_lsd = 4'b0001; 
            t_four_to_one_sel = 2'b00;
            
            //17
            #50
            t_input_sign = 0;
            t_user_msd = 4'b1000;
            t_user_lsd = 4'b0001; 
            t_four_to_one_sel = 2'b01;
            
            //18
            #50
            t_input_sign = 0;
            t_user_msd = 4'b1001;
            t_user_lsd = 4'b0000; 
            t_four_to_one_sel = 2'b10;
            
            //19
            #50
            t_input_sign = 0;
            t_user_msd = 4'b1001;
            t_user_lsd = 4'b0000; 
            t_four_to_one_sel = 2'b11;
            
        end
endmodule
