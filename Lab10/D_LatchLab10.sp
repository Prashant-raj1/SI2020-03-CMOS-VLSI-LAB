***** Spice Netlist for Cell 'D_LatchLab10' *****
.LIB /project2020/eda/ngspice-32/models/scn4m_subm/scmos_bsim4.lib nom
.TEMP 27

.GLOBAL vdd gnd

***********Teastbench************

v0 vdd gnd DC 2.5
v1 D gnd pulse 0 2.5 1n 100p 100p 3n 6n
v2 CK gnd pulse 0 2.5 1.5n 100p 100p 6n 12n
Xdlatch D CK Q D_LatchLab10



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

.tran 5p 25n
.control
RUN 
PLOt v(D)+6 c(CK)+3 v(Q)
.endc
.end

