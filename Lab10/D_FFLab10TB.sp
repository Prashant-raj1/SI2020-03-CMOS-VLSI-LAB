################ Testbench for D_FF #################

.LIB /project2020/eda/ngspice-32/models/scn4m_subm/scmos_bsim4.lib nom
.TEMP 27
.GLOBAL vdd gnd
.INCLUDE D_FFLab10.sp

v0 vdd gnd DC 2.5
vin1 D gnd pulse 0 2.5 1n 100p 100p 3n 6n
vin2 CK gnd pulse 0 2.5 1.5n 100p 100p 4n 8n
Xdff D CK Q D_FFLab10

.tran 5p 60n
.control
RUN 
PLOT v(D)+6 v(CK)+3 v(Q)
.endc
.end
