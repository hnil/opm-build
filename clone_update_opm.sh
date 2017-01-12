#!/bin/bash
if [ ! -d opm-src ]; then
    mkdir opm-src
else
    echo "opm-src exist"
fi  
cd opm-src

master_order='opm-common opm-parser opm-material opm-grid opm-output opm-core ewoms opm-simulators opm-upscaling'
master_order='opm-common opm-parser opm-material opm-grid opm-output opm-core ewoms opm-simulators opm-upscaling'

repos=$master_order
for r in $repos; do
    if [ -d "$r" ]; then
	echo "${r} exist"
        cd "${r}"
	git pull
	cd ..
    else	
	git clone git@github.com:OPM/"${r}.git"
    fi
done




# downlod ert
if [ -d ert ]; then
    echo "ert exist"
    cd ert
    git pull
    cd ..
 else	
     git clone git@github.com:Ensembles/ert
 fi

# downlod ert
if [ -d eigen3 ]; then
    echo "ert exist"
    cd eigen3
    git pull
    cd ..
 else	
     git clone git@github.com:OPM/eigen3
 fi
