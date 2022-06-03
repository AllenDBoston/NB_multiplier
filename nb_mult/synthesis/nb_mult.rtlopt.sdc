###################################################################

# Created by write_sdc on Sun May  8 19:54:00 2022

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -power mW -voltage V       \
-current mA
set_operating_conditions tt_1p0v_25c -library scadv12_cmos10sf_rvt_tt_1p0v_25c
set_wire_load_mode segmented
set_wire_load_model -name cmos10sf_wl5 -library                                \
scadv12_cmos10sf_rvt_tt_1p0v_25c
set_max_fanout 64 [current_design]
set_load -pin_load 0.009269 [get_ports {Z[4]}]
set_load -pin_load 0.009269 [get_ports {Z[3]}]
set_load -pin_load 0.009269 [get_ports {Z[2]}]
set_load -pin_load 0.009269 [get_ports {Z[1]}]
set_load -pin_load 0.009269 [get_ports {Z[0]}]
create_clock [get_ports clk]  -name clock  -period 1  -waveform {0 0.5}
set_clock_uncertainty 0.05  [get_clocks clock]
set_input_delay -clock clock  -max 0.1  [get_ports en]
set_input_delay -clock clock  -max 0.1  [get_ports {A[4]}]
set_input_delay -clock clock  -max 0.1  [get_ports {A[3]}]
set_input_delay -clock clock  -max 0.1  [get_ports {A[2]}]
set_input_delay -clock clock  -max 0.1  [get_ports {A[1]}]
set_input_delay -clock clock  -max 0.1  [get_ports {A[0]}]
set_input_delay -clock clock  -max 0.1  [get_ports {B[4]}]
set_input_delay -clock clock  -max 0.1  [get_ports {B[3]}]
set_input_delay -clock clock  -max 0.1  [get_ports {B[2]}]
set_input_delay -clock clock  -max 0.1  [get_ports {B[1]}]
set_input_delay -clock clock  -max 0.1  [get_ports {B[0]}]
set_output_delay -clock clock  -max 0.05  [get_ports {Z[4]}]
set_output_delay -clock clock  -max 0.05  [get_ports {Z[3]}]
set_output_delay -clock clock  -max 0.05  [get_ports {Z[2]}]
set_output_delay -clock clock  -max 0.05  [get_ports {Z[1]}]
set_output_delay -clock clock  -max 0.05  [get_ports {Z[0]}]
