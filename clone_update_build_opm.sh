#!/bin/bash
if [ ! -d opm-src ]; then
    mkdir opm-src
else
    echo "opm-src exist"
fi  
cd opm-src

master_order='opm-common opm-parser opm-material opm-grid opm-output opm-core ewoms opm-simulators opm-upscaling'
master_release='opm-common opm-parser opm-material opm-output opm-core opm-grid opm-simulators opm-upscaling ewoms'

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

for r in $repos; do
    if [ -d "$r" ]; then
	cd "${r}"
    else
       echo " do not exit ${r} exist"
       exit 1
    fi
    if( [ ! -d build ]); then
      mkdir build
    fi	  
    cd build
    cmake ..
    make -j 10
    cd ../../
done
