
`ifdef RANGE_CHECK           
  `undef RANGE_CHECK         
`endif           
`ifdef REMOVE_DATAPATH_FLOP_RESET           
  `undef REMOVE_DATAPATH_FLOP_RESET         
`endif           
`ifdef EF_LB_OR_DUAL_LB           
  `undef EF_LB_OR_DUAL_LB         
`endif           
`ifdef EF_MT_OR_AMT           
  `undef EF_MT_OR_AMT         
`endif                
`ifdef EF_AXI           
  `undef EF_AXI         
`endif                  
`ifdef EF_MPFE          
  `undef EF_MPFE        
`endif                  
`ifdef EF_LB            
  `undef EF_LB          
`endif                  
`ifdef EF_ECC           
  `undef EF_ECC         
`endif                  
`ifdef EF_RMW           
  `undef EF_RMW         
`endif                  
`ifdef AXI0_ENABLE      
  `undef AXI0_ENABLE    
`endif                  
`ifdef AXI1_ENABLE      
  `undef AXI1_ENABLE    
`endif                  
`ifdef AXI2_ENABLE      
  `undef AXI2_ENABLE    
`endif                  
`ifdef AXI3_ENABLE      
  `undef AXI3_ENABLE    
`endif                  
`ifdef AXI4_ENABLE      
  `undef AXI4_ENABLE    
`endif                  
`ifdef AXI5_ENABLE      
  `undef AXI5_ENABLE    
`endif                  
`ifdef AXI6_ENABLE      
  `undef AXI6_ENABLE    
`endif                  
`ifdef AXI7_ENABLE      
  `undef AXI7_ENABLE    
`endif                  
`ifdef LB0_DISABLE      
  `undef LB0_DISABLE    
`endif                  
`ifdef LB1_DISABLE      
  `undef LB1_DISABLE    
`endif                  
`ifdef LB2_DISABLE      
  `undef LB2_DISABLE    
`endif                  
`ifdef LB3_DISABLE      
  `undef LB3_DISABLE    
`endif                  
`ifdef LB4_DISABLE      
  `undef LB4_DISABLE    
`endif                  
`ifdef LB5_DISABLE      
  `undef LB5_DISABLE    
`endif                  
`ifdef LB6_DISABLE      
  `undef LB6_DISABLE    
`endif                  
`ifdef LB7_DISABLE      
  `undef LB7_DISABLE    
`endif 

`define SYNTHESIS

`define EF_AXI

`define EF_MPFE

`define EF_RMW

`define REMOVE_DATAPATH_FLOP_RESET

`define AXI0_ENABLE

`define LB0_DISABLE

`define LB1_DISABLE

`define LB2_DISABLE

`define LB3_DISABLE

`define LB4_DISABLE

`define LB5_DISABLE

`define LB6_DISABLE

`define LB7_DISABLE

