######### inverter static characteristics #######

*include Model file
.LIB /project2020/eda/ngspice-32/models/scn4m_subm/scmos_bsim4.lib nom
.TEMP 27

*.PARAM wn=2u
*.PARAM wp=3*wn
*.PARAM lc=1u


*define supply
vsupply    	vd	0	DC	2.5
vin		in	0	DC	2.5

*define MOSFET
MP1	out	in	vd	vd	scmosp	w=3u	l=1u	m=1
MN1	out	in	0	0	scmosn	w=1u	l=1u	m=1

MP2	out2	in	vd	vd	scmosp	w=3u	l=1u	m=1
MN2 	out2	in	0	0	scmosn	w=3u	l=1u	m=1

MP3	out3	in	vd	vd	scmosp	w=9u	l=1u	m=1
MN3	out3	in	0	0	scmosn	w=1u	l=1u	m=1
*sweep input voltage
.dc	vin	0	2.5	0.001

*control statements
.CONTROL
run
plot   v(out)	v(out2)	  v(out3)	vs	v(in)
.ENDC
.END
