import uvm_pkg::*;

`include "uvm_macros.svh"

`include "interface.sv"

//`include "DESIGN.sv"

//`include "DUT.sv"

`include "sequenc_item.sv"

`include "sequence.sv"

`include "sequencer.sv"

`include "driver.sv"

`include "coverage.sv"

`include "mon1.sv"

`include "mon2.sv"

`include "AGENT1.sv"

`include "AGENT2.sv"

`include "scoreboard.sv"

`include "ENV.sv"

`include "TEST.sv"

module dram_top();

bit clk;

initial

begin

clk=1'b0;

forever #5 clk=~clk;

end

intif inf(clk);

DUT dut(inf);

initial

begin

uvm_config_db#(virtual intif)::set(uvm_root::get(),"*","inf",inf);

run_test("dram_test");

end

endmodule