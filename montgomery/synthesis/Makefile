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
	-\rm montgomery.dcopt.out
	-\rm montgomery.dcopt.v
	-\rm montgomery.dcopt.area
	-\rm montgomery.dcopt.constraints
	-\rm montgomery.dcopt.ddc
	-\rm montgomery.dcopt.fullpaths
	-\rm montgomery.dcopt.paths
	-\rm montgomery.dcopt.power
	-\rm montgomery.dcopt.sdc
	-\rm montgomery.dcopt.sdf
	-\rm montgomery.dcopt.svf
	-\rm montgomery.dcopt.vsdc
	-\rm montgomery.rtlopt.out
	-\rm montgomery.rtlopt.ddc
	-\rm montgomery.rtlopt.sdc
	-\rm montgomery.rtlopt.v
	-\rm montgomery.spef
	-\rm command.log
	-\rm default.svf
	-\rm -rf ./../pnr/design_files

vcheck:
	./montgomery.rtlopt.csh
	-\grep -s 'Warning\|Error' montgomery.rtlopt.out

syn:
	rm -rf ./../pnr/design_files
	mkdir ./../pnr/design_files
	./montgomery.dcopt.csh
	-\grep 'Warning\|Error' montgomery.dcopt.out
	tail montgomery.dcopt.constraints


