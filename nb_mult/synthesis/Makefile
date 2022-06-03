########################################
# Only necessary for running MODELSIM:
# 
# In your shell (I use tcsh): you may need to define the license file
# before running make:
#
# setenv LM_LICENSE_FILE /uusoc/facility/cad_tools/Mentor/common_license
#

#MODELTECH_BIN=/uusoc/facility/cad_tools/Mentor/MSIM-S17/linux_x86_64
#CADTOOLS=/uusoc/facility/cad_common/local/bin/S17:/uusoc/facility/cad_common/local/bin/F16:/uusoc/facility/cad_common/local/bin/S16:/uusoc/facility/cad_common/local/bin/F15:/uusoc/facility/cad_common/local/bin/S15:/uusoc/facility/cad_common/local/bin/F14:/uusoc/facility/cad_common/local/bin/S14:/uusoc/facility/cad_common/local/bin/F13:/uusoc/facility/cad_common/local/bin/S13
# Add tools paths to PATH
#PATH=.:/usr/bin:/usr/ccs/bin:/usr/ucb:/usr/afsws/bin:/usr/afsws/etc:/bin:/usr/sbin:/usr/dt/bin:/uusoc/facility/cad_common/local/bin/:${CADTOOLS}:${MODELTECH_BIN}
#
########################################


all: clean py_compile vcheck syn sim validate

clean:
	echo ${path}
	-\rm test/GoldenResult
	-\rm test/VerilogResult
	-\rm goldenmodel/goldenmodel
	-\rm nb_mult.dcopt.out
	-\rm nb_mult.dcopt.v
	-\rm nb_mult.dcopt.area
	-\rm nb_mult.dcopt.constraints
	-\rm nb_mult.dcopt.ddc
	-\rm nb_mult.dcopt.fullpaths
	-\rm nb_mult.dcopt.paths
	-\rm nb_mult.dcopt.power
	-\rm nb_mult.dcopt.sdc
	-\rm nb_mult.dcopt.sdf
	-\rm nb_mult.dcopt.svf
	-\rm nb_mult.dcopt.vsdc
	-\rm nb_mult.rtlopt.out
	-\rm nb_mult.rtlopt.ddc
	-\rm nb_mult.rtlopt.sdc
	-\rm nb_mult.rtlopt.v
	-\rm nb_mult.spef
	-\rm command.log
	-\rm default.svf
	-\rm -rf ./../pnr/design_files


vcheck:
	./nb_mult.rtlopt.csh
	-\grep -s 'Warning\|Error' nb_mult.rtlopt.out

syn:
	rm -rf ./../pnr/design_files
	mkdir ./../pnr/design_files
	./nb_mult.dcopt.csh
	-\grep 'Warning\|Error' nb_mult.dcopt.out
	tail nb_mult.dcopt.constraints

sim:
	vlog aes.dcopt.v
	vlog /uusoc/facility/cad_common/Artisan/GF/cmos65g/aci/sc-adv12/verilog/cmos10sfrvt_a12_neg.v
	vsim -c -sdftyp /aes_128=aes_128.dcopt.sdf -t ps -do aes_128.do work.aes_128

validate:
	diff -c test/GoldenResult test/VerilogResult
