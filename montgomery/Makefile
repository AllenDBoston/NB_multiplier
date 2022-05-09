


build:
	vlog -work work ./rtl/montgomery.v ./testbench/mont_tb.v
sim:
	vsim -c mont_tb -voptargs="+acc" -do ./testbench/wave.do

