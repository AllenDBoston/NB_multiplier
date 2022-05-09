###################################################################

# Created by write_sdc on Sun May  8 17:05:26 2022

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
