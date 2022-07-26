#!/usr/bin/env bash
###
 # @brief: 
 # @FilePath: /dr_app/3rd_party/flatcc/samples/nv_sys_param/build.sh
 # @Version: v0.0.1
 # @Date: 2022-07-05 19:48:54
 # Copyright (c) 2022, Nephotonics Holding Limited.
### 

set -e
cd `dirname $0`/../..
ROOT=`pwd`
NAME=nv_sys_param
ARM_NAME=nv_sys_param_arm
TMP=${ROOT}/build/tmp/samples/${NAME}
EX=${ROOT}/samples/${NAME}

ARM_CC=aarch64-linux-gnu-gcc
CC=${CC:-cc}
CFLAGS_DEBUG="-g -I ${ROOT}/include"
CFLAGS_RELEASE="-O3 -DNDEBUG -I ${ROOT}/include"
#${ROOT}/scripts/build.sh
# mkdir -p ${TMP}
# rm -rf ${TMP}/*
bin/flatcc -a -o ${TMP} ${EX}/${NAME}.fbs

cp ${EX}/*.c ${TMP}
cd ${TMP}

#echo "building $NAME example (debug)"
#$CC $CFLAGS_DEBUG ${NAME}.c ${ROOT}/lib/libflatccrt_d.a -o ${NAME}_d
echo "building $NAME example (release)"
$CC $CFLAGS_RELEASE ${NAME}.c ${ROOT}/lib/libflatccrt.a -o ${NAME}
$ARM_CC $CFLAGS_RELEASE ${NAME}.c ${ROOT}/cross_lib/libflatccrt.so -o ${ARM_NAME}

#echo "running $NAME example (debug)"
#./${NAME}_d
