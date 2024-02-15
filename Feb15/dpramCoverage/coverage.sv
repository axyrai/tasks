class dram_cov extends uvm_subscriber#(dram_seq_item);
  `uvm_component_utils(dram_cov)
  uvm_analysis_imp#(dram_seq_item, dram_cov) analysis_export;
  dram_seq_item packet;

  covergroup cg;
    option.per_instance = 1;
    option.comment = "functional cov";
    option.auto_bin_max=256;
    
    DATA : coverpoint packet.data_in {
      bins din[] = {[0:255]};
    }
    ADDRESS:coverpoint packet.add{
      bins addr[] = {[0:64]};
    }
    WRITE: coverpoint packet.wr{
      bins writ[] ={[0:1]};
    }
    ENABLE: coverpoint packet.en{
      bins ena[] = {[0:1]};
    }

  endgroup

  extern function new(string name="dram_cov",uvm_component parent);
  extern function void write(dram_seq_item t);


endclass

function dram_cov::new(string name="dram_cov", uvm_component parent);
  super.new(name, parent);
  analysis_export= new("analysis_export",this);
  packet = dram_seq_item::type_id::create("packet");
  cg=new();
endfunction : new

function void dram_cov::write(dram_seq_item t);
  packet = t;
  cg.sample();
  $display("Coverage = %0d ", cg.get_coverage());
endfunction
      
 
