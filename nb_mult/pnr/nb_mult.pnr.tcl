


# Import Design
set design_netlisttype verilog
set init_verilog ./design_files/nb_mult.dcopt.v
set init_design_set_top 1
set init_top_cell "nb_mult"

set init_lef_file /home/ece6770/proj/innovus_files/cmos10sfrvt_a12_macros.lef


set init_pwr_net vdd!
set init_gnd_net vss!

set init_mmmc_file ./mmmc.tcl
init_design


# Floorplanning
setDrawView fplan
#set FPlanRowSpacingAndType $rowgap 1
floorplan -r 0.5 0.7 12 12  12 12

# Pwr Rings
addRing -nets {vdd! vss!} \
    -type core_rings      \
    -around user_defined  \
    -center 1             \
    -spacing 1.8          \
    -width 4.6            \
    -offset 0        \
    -threshold auto       \
    -layer {bottom BD top BD right LB left LB}

# add strip vertical
addStripe -nets {vdd! vss!} \
    -direction vertical     \
    -layer LB               \
    -width 4.8              \
    -spacing 1.8            \
    -xleft_offset 80        \
    -set_to_set_distance 132 \
    -block_ring_top_layer_limit LB \
    -block_ring_bottom_layer_limit M1 \
    -padcore_ring_bottom_layer_limit M1 \
    -padcore_ring_top_layer_limit LB \
    -stacked_via_top_layer LB \
    -stacked_via_bottom_layer M1 \
    -merge_stripes_value 10 \
    -max_same_layer_jog_length 2.0 \
    -snap_wire_center_to_grid Grid



## special routing 
sroute -connect {blockPin padPin padRing corePin floatingStripe} \
    -allowJogging true \
    -allowLayerChange true \
    -blockPin useLef \
    -targetViaLayerRange {M1 LB} 

## Pins
editPin -side TOP \
    -layer M3   \
    -fixedPin 1 \
    -spreadType Center \
    -spacing 5 \
    -pin {A[0] A[1] A[2] A[3] A[4]}

editPin -side BOTTOM \
    -layer M3   \
    -fixedPin 1 \
    -spreadType Center \
    -spacing 5 \
    -pin {B[0] B[1] B[2] B[3] B[4]}

editPin -side LEFT \
    -layer M3   \
    -fixedPin 1 \
    -spreadType Center \
    -spacing 5 \
    -pin {Z[0] Z[1] Z[2] Z[3] Z[4]}

editPin -side RIGHT \
    -layer M3   \
    -fixedPin 1 \
    -spreadType Center \
    -spacing 5 \
    -pin {clk en}


## place
setPlaceMode -timingDriven true \
    -congEffort auto      \
    -ignoreScan true \
    -placeIoPins true \
    
placeDesign -noPrePlaceOpt
setDrawView place

### Timing Optimization
setOptMode -yieldEffort none \
    -effort high \
    -maxDensity 0.95 \
    -fixDRC true \
    -fixFanoutLoad true \
    -optimizeFF true \
    -simplifyNetlist false \
    -holdTargetSlack 0.0 \
    -setupTargetSlack 0.0 
clearClockDomains
setClockDomains -all
setOptMode -usefulSkew false 
optDesign -preCTS -drv \
    -outDir ./reports/preCTSOptTiming


### CTS

setCTSMode -routeGuide true
setCTSMode -routeCLKNet true 
clockDesign -outDir ./reports/cts

### NanoRoute 
globalDetailRoute

# Add Filler Cells
set fillerCells [list FILL1A12TR FILL2A12TR FILL4A12TR FILL8A12TR FILL16A12TR FIL32A12TR FILL64A12TR FILL128A12TR]
setFillerMode -corePrefix arbiter_FILL -core $fillerCells
addFiller -cell $fillerCells -prefix arbiterFILL -markFixed


# Verification
verifyConnectivity -type regular -error 50 -warning 50 -report ./reports/conn_regular.rpt
verifyConnectivity -type special -error 50 -warning 50 -report ./reports/conn_special.rpt
verifyGeometry -allowSameCellViols -noSameNet -noOverlap -report ./reports/geim.rpt
