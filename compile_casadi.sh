sudo apt-get install liboctave-dev -y

rm -rf build
mkdir build
cd build

# get casadi source code
git clone https://github.com/casadi/casadi.git --depth=1 casadi

# build casadi for linux
cd casadi
mkdir build
cd build

# export CXXFLAGS=x86_64-pc-linux
export CC=clang
export CXX=clang++

cmake -DWITH_SLICOT=OFF -DWITH_DEEPBIND=ON -DWITH_OCTAVE=ON -DWITH_OCTAVE_IMPORT=ON -DWITH_OPENMP=ON -DWITH_EXTRA_WARNINGS=ON -DWITH_EXTRA_CHECKS=ON -DWITH_EXTRA_WARNINGS=ON -DWITH_JSON=ON ..
make -j4

# get OpenOCL source code
# git clone https://github.com/OpenOCL/OpenOCL.git

# create linux package
