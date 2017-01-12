#!/bin/bash
if [ ! -d opm-src ]; then
    echo "opm-src do not exit"
    exit 1
fi  
cd opm-src
# to do full build with ont ert and eigen this needs to be uncommented

# if [ -d ert ]; then
#     cd ert
#     if [ ! -d build ];then
# 	mkdir build
#     fi
#     cd build   
#     cmake ..
#     make -j 10
#     sudo make install
#     cd ../../
# else
#     echo "opm-src exist"
#     exit 1;
# fi  
# if [ -d eigen3 ]; then
#     cd eigen3
#     if [ ! -d build ];then
# 	mkdir build
#     fi
#     cd build  
#     cmake ..
#     sudo make install
#     cd ../../
# else
#     echo "opm-src exist"
#     exit 1;
# fi

master_order='opm-common opm-parser opm-material opm-grid opm-output opm-core ewoms opm-simulators opm-upscaling'
#master_order='opm-common opm-parser opm-material opm-grid opm-output opm-core ewoms opm-simulators opm-upscaling'

repos=$master_order
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
    #cmake ..
    make -j 10
    if [ $? -eq 0 ]; then
	echo "compiled ${r} succesfully"
    else
	echo "compilation of ${r} failed"
	exit 1;
    fi
    cd ../../
done
