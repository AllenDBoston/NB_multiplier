#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Sun May  8 19:57:18 2022                
#                                                     
#######################################################

#@(#)CDS: Innovus v20.15-s105_1 (64bit) 07/27/2021 14:15 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: NanoRoute 20.15-s105_1 NR210726-1341/20_15-UB (database version 18.20.554) {superthreading v2.14}
#@(#)CDS: AAE 20.15-s020 (64bit) 07/27/2021 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: CTE 20.15-s024_1 () Jul 23 2021 04:46:45 ( )
#@(#)CDS: SYNTECH 20.15-s012_1 () Jul 12 2021 23:29:38 ( )
#@(#)CDS: CPE v20.15-s071
#@(#)CDS: IQuantus/TQuantus 20.1.1-s460 (64bit) Fri Mar 5 18:46:16 PST 2021 (Linux 2.6.32-431.11.2.el6.x86_64)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
set init_verilog ./design_files/nb_mult.dcopt.v
set init_top_cell nb_mult
set init_lef_file /home/ece6770/proj/innovus_files/cmos10sfrvt_a12_macros.lef
set init_pwr_net vdd!
set init_gnd_net vss!
set init_mmmc_file ./mmmc.tcl
init_design
setDrawView fplan
floorPlan -r 0.5 0.7 12 12 12 12
addRing -nets {vdd! vss!} -type core_rings -around user_defined -center 1 -spacing 1.8 -width 4.6 -offset 0 -threshold auto -layer {bottom BD top BD right LB left LB}
addStripe -nets {vdd! vss!} -direction vertical -layer LB -width 4.8 -spacing 1.8 -xleft_offset 80 -set_to_set_distance 132 -block_ring_top_layer_limit LB -block_ring_bottom_layer_limit M1 -padcore_ring_bottom_layer_limit M1 -padcore_ring_top_layer_limit LB -stacked_via_top_layer LB -stacked_via_bottom_layer M1 -merge_stripes_value 10 -max_same_layer_jog_length 2.0 -snap_wire_center_to_grid Grid
sroute -connect {blockPin padPin padRing corePin floatingStripe} -allowJogging true -allowLayerChange true -blockPin useLef -targetViaLayerRange {M1 LB}
fit
