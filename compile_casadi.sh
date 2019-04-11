sudo apt-get install liboctave-dev -y
sudo apt-get install autotools-dev automake -y
sudo apt-get install libpcre3 libpcre3-dev -y
sudo apt-get install bison flex -y

git clone https://github.com/jaeandersson/swig.git swig_matlab --depth=1
cd swig_matlab
git checkout -b origin/matlab-customdoc
sh autogen.sh
./configure --prefix=/tmp/swig_matlab
make -j4
make install
export PATH=$PATH:/tmp/swig_matlab/bin

cd ..

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
