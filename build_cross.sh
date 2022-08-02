
###
 # @FilePath: /dr_app/3rd_party/flatcc/build_cross.sh
 # @brief: 
 # @Version: v0.0.1
 # @Date: 2022-08-02 14:37:29
 # Copyright (c) 2022, Nephotonics Holding Limited.
### 
mkdir -p build_cross
mkdir -p cross_lib
cd build_cross
cmake ../ -DBUILD_SHARED_LIBS=on -DFLATCC_RTONLY=on -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=arm-linux-gnueabihf-9.1.0-gcc
make -j2
cp ../lib/libflatccrt.so ../cross_lib
cd ..
rm -rf build_cross