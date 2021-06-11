***** Spice Netlist for Cell 'D_FFLab10' *****

************** Module D_FFLab10 **************
.subckt D_FFLab10 d ck q
xi0 ck d n0 D_LatchLab10
xi1 n1 n0 q D_LatchLab10
d0 ck n1 invlab10
.ends D_FFLab10

************** Module TX_GateLab10 **************
.subckt TX_GateLab10 input output ckb ck example_param=1.0
m0 input ck output gnd scmosn w='0.6u' l='0.4u' m='1' 
m1 input ckb output vdd scmosp w='0.6u' l='0.4u' m='1' 
.ends TX_GateLab10

************** Module invlab10 **************
.subckt invlab10 input output example_param=1.0
m0 output input gnd gnd scmosn w='1u' l='0.4u' m='1' 
m1 output input vdd vdd scmosp w='2.5u' l='0.4u' m='1' 
.ends invlab10

************** Module D_LatchLab10 **************
.subckt D_LatchLab10 ck d q example_param=1.0
xi0 d n2 invlab10
xi1 n1 n0 clkb clk TX_GateLab10
xi2 q n1 invlab10
xi3 ck clkb invlab10
xi4 n0 q invlab10
xi5 n2 n0 clk clkb TX_GateLab10
xi6 clkb clk invlab10
.ends D_LatchLab10


