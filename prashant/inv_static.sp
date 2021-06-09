######### inverter static characteristics #########

*include Model file
.LIB /project2020/eda/ngspice-32/models/scn4m_subm/scmos_bsim4.lib nom
.TEMP 27

.PARAM wn=3u
.PARAM wp=3*wn
.param lc=1u

*define supply
vsupply 	vd 	0 	DC 	2.5
vin 		in 	0 	DC 	2.5

*Define MOSFET
MP1 	out 	in 	vd 	vd 	scmosp         w=wp       l=lc       m=1
MN1 	out 	in 	0 	0	scmosn         w=wn       l=lc       m=1

.dc 	vin 	0 	2.5 	0.001

*control statements
.CONTROL
run 
plot v(out) vs v(in)
.ENDC
.END
