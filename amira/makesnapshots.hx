# Amira Script
# make sequence of snapshots showing more and more PN classes
# Created by Gregory Jefferis 2011-07-22
# Run on Amira 5.3.2 on MacOSX 10.6

# SETUP:
# 1) load MasterObject.scro and then manually select any list file (e.g. lists/1_listfile.txt)
# 2) Hit LoadAll

# Now you can drag and drop this script Amira

# Select and make output directory
set snapshotsFolder ${SCRIPTDIR}/snapshots/
file mkdir $snapshotsFolder

# now start doing colouring things
# using setneuroncolors.hx
source ${SCRIPTDIR}/setneuroncolors.hx

# This leads to much cleaner lines (less staircasing)
# but the background looks weird
viewer antiAlias 8

# camera definitions for different views
proc frontalView { } {
	viewer setSize 1024 768
	viewer setCameraOrientation 0.986569 0.133099 -0.0946922 2.25135
	viewer setCameraPosition 64.6672 -83.2501 -119.03
	viewer setCameraFocalDistance 261.859
	viewer setCameraNearDistance 182.595
	viewer setCameraFarDistance 326.54
	viewer setCameraType orthographic
	viewer setCameraHeight 154.228
}

proc frontalView2 { } {
	viewer setCameraOrientation 0.975571 0.115462 -0.186897 2.64227
	viewer setCameraPosition 56.0848 70.3611 -33.0996
	viewer setCameraFocalDistance 85.9531
	viewer setCameraNearDistance 0.122139
	viewer setCameraFarDistance 169.889
	viewer setCameraType orthographic
	viewer setCameraHeight 143.378
}

# hide all neurons
masterObject.scro showLineViews 1
masterObject.scro compute
frontalView2
masterObject.scro showLineViews 0
masterObject.scro compute

# Just one DL1
# TMB2L.am.lv setViewerMask 1
# TKC1R.am.lv setViewerMask 0
# SC5R.am.lv setViewerMask 0
# OT15R.am.lv setViewerMask 0
# LG17L.am.lv setViewerMask 0
# LF4L.am.lv setViewerMask 0
# LE17R.am.lv setViewerMask 0
# KJA6L.am.lv setViewerMask 0
# KGA2L.am.lv setViewerMask 0
# EBG2R.am.lv setViewerMask 0
# EBG10L.am.lv setViewerMask 0
# EBE22R.am.lv setViewerMask 0
# EBE21R.am.lv setViewerMask 0
EBE14L.am.lv setViewerMask 1
frontalView2
viewer snapshot ${snapshotsFolder}1.SingleDL1.png

# All DL1s
DL1 showLineViews 1
viewer snapshot ${snapshotsFolder}2.AllDL1.png

DA1 showLineViews 1
viewer snapshot ${snapshotsFolder}3.AllDL1DA1.png
VM7 showLineViews 1
viewer snapshot ${snapshotsFolder}4.AllDL1DA1VM7.png
VA1d showLineViews 1
viewer snapshot ${snapshotsFolder}5.AllDL1DA1VM7VA1d.png
DM1 showLineViews 1
viewer snapshot ${snapshotsFolder}6.AllDL1DA1VM7VA1dDM1.png
DM3 showLineViews 1
viewer snapshot ${snapshotsFolder}7.AllDL1DA1VM7VA1dDM1DM3.png
DP1m showLineViews 1
viewer snapshot ${snapshotsFolder}8.AllDL1DA1VM7VA1dDM1DP1m.png
vVL1 showLineViews 1
viewer snapshot ${snapshotsFolder}9.AllDL1DA1VM7VA1dDM1DP1mvVL1.png

# Now all the rest - do this explicitly for each PN class
1  showLineViews 1
D  showLineViews 1
DC1  showLineViews 1
DC2  showLineViews 1
DC3  showLineViews 1
DL3  showLineViews 1
DL5  showLineViews 1
DL6  showLineViews 1
VA1d  showLineViews 1
VA1lm  showLineViews 1
VA2  showLineViews 1
VA3  showLineViews 1
VA6  showLineViews 1
VA7  showLineViews 1
VA7l  showLineViews 1
VC2  showLineViews 1
vDA1  showLineViews 1
VL2p  showLineViews 1
VL2pP  showLineViews 1
VM1  showLineViews 1
VM2  showLineViews 1
VM3  showLineViews 1
VM7  showLineViews 1
vVA1lm  showLineViews 1

# could also have turned everyone on and then turned off these

# turn off LHNS:
# acj6 showLineViews 0
# NP5194 showLineViews 0
# NP6099 showLineViews 0
# --
# turn off PNs that stick out too far:
# DA3 showLineViews 0
# vmulti showLineViews 0

viewer snapshot ${snapshotsFolder}10.AllPNs.png
