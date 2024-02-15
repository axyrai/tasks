compile:
	vlog -coveropt 3 +cover +acc testbench.sv

simulate:
	vsim -coverage -vopt work.dram_top -c -do "coverage save -onexit -directive -codeAll coverage_data; run -all; exit"

codeCoverage:
	vcover report -html coverage_data
