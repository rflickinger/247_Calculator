# SLIDE SWITCH INPUTS
#D
set_property PACKAGE_PIN J15 [get_ports D];
set_property iostandard LVCMOS33 [get_ports D];

#I0
set_property PACKAGE_PIN L16 [get_ports I[0]];
set_property iostandard LVCMOS33 [get_ports I[0]];

#I1
set_property PACKAGE_PIN M13 [get_ports I[1]];
set_property iostandard LVCMOS33 [get_ports I[1]];

#I2
set_property PACKAGE_PIN R15 [get_ports I[2]];
set_property iostandard LVCMOS33 [get_ports I[2]];

#I0
set_property PACKAGE_PIN R17 [get_ports I[3]];
set_property iostandard LVCMOS33 [get_ports I[3]];

#BUTTON SWITCH INPUTS
#clck
set_property PACKAGE_PIN N17 [get_ports clck];
set_property iostandard LVCMOS33 [get_ports clck];

#reste
set_property PACKAGE_PIN M18 [get_ports reste];
set_property iostandard LVCMOS33 [get_ports reste];

# LED OUPUTS
#Q
set_property PACKAGE_PIN H17 [get_ports Q];
set_property iostandard LVCMOS33 [get_ports Q];

#Q_b
set_property PACKAGE_PIN K15 [get_ports Q_b];
set_property iostandard LVCMOS33 [get_ports Q_b];

#A0
set_property PACKAGE_PIN J13 [get_ports A[0]];
set_property iostandard LVCMOS33 [get_ports A[0]];

#A1
set_property PACKAGE_PIN N14 [get_ports A[1]];
set_property iostandard LVCMOS33 [get_ports A[1]];

#A2
set_property PACKAGE_PIN R18 [get_ports A[2]];
set_property iostandard LVCMOS33 [get_ports A[2]];

#A3
set_property PACKAGE_PIN V17 [get_ports A[3]];
set_property iostandard LVCMOS33 [get_ports A[3]];

set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets Q_OBUF];
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets _nand_2];
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets _nand_30]; 

set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets {A_OBUF[0]});
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets {A_OBUF[1]});
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets {A_OBUF[2]});
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets {A_OBUF[3]});
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets dff0/_nand_2);
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets dff0/_nand_30);
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets dff1/_nand_2);
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets dff1/_nand_30);
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets dff2/_nand_2);
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets dff2/_nand_30);
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets dff3/_nand_2);
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets dff3/_nand_30);