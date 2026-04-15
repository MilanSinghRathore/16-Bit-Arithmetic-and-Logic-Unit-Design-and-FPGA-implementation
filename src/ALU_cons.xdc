# A[3:0]  (SW0–SW3)
set_property PACKAGE_PIN T8 [get_ports {sw_a[0]}]
set_property PACKAGE_PIN U8 [get_ports {sw_a[1]}]
set_property PACKAGE_PIN V8 [get_ports {sw_a[2]}]
set_property PACKAGE_PIN W8 [get_ports {sw_a[3]}]

# B[3:0]  (SW4–SW7)
set_property PACKAGE_PIN T7 [get_ports {sw_b[0]}]
set_property PACKAGE_PIN U7 [get_ports {sw_b[1]}]
set_property PACKAGE_PIN V7 [get_ports {sw_b[2]}]
set_property PACKAGE_PIN W7 [get_ports {sw_b[3]}]

set_property IOSTANDARD LVCMOS33 [get_ports {sw_a[*] sw_b[*]}]
# Buttons
set_property PACKAGE_PIN M4 [get_ports {btn[0]}]
set_property PACKAGE_PIN M5 [get_ports {btn[1]}]
set_property PACKAGE_PIN M6 [get_ports {btn[2]}]

set_property IOSTANDARD LVCMOS33 [get_ports {btn[*]}]
# Result LEDs
set_property PACKAGE_PIN N8 [get_ports {led[0]}]
set_property PACKAGE_PIN P8 [get_ports {led[1]}]
set_property PACKAGE_PIN R8 [get_ports {led[2]}]
set_property PACKAGE_PIN T9 [get_ports {led[3]}]

# Flags
set_property PACKAGE_PIN Y8  [get_ports carry]
set_property PACKAGE_PIN W10 [get_ports zero]
set_property PACKAGE_PIN V10 [get_ports overflow]

set_property IOSTANDARD LVCMOS33 [get_ports {led[*] carry zero overflow}]
