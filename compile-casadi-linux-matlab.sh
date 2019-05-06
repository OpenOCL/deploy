# cmake 2.8
wget http://www.cmake.org/files/v2.8/cmake-2.8.12.tar.gz
tar xzf cmake-2.8.12.tar.gz
cd cmake-2.8.12
./configure --prefix=$HOME/cmake-install
make 
make install
export PATH=$HOME/cmake-install/bin:$PATH

sudo apt-get install p7zip-full -y
sudo apt-get install bison -y

# get ipopt
wget http://www.coin-or.org/download/source/Ipopt/Ipopt-3.12.3.tgz
tar -xf Ipopt-3.12.3.tgz
cd Ipopt-3.12.3
cd ThirdParty

cd Blas 
./get.Blas
cd ..

cd Lapack 
./get.Lapack
cd ..

cd Metis 
./get.Metis
cd ..

cd Mumps 
./get.Mumps
cd ..

cd ..
mkdir build
cd build
mkdir $HOME/ipopt-install
../configure coin_skip_warn_cxxflags=yes --prefix=$HOME/ipopt-install --disable-shared ADD_FFLAGS=-fPIC ADD_CFLAGS=-fPIC ADD_CXXFLAGS=-fPIC --with-blas=BUILD --with-lapack=BUILD --with-mumps=BUILD --with-metis=BUILD --without-hsl --without-asl
make
make install
cd ..
cd ..

# swig matlab
sudo apt-get install -y libpcre3-dev automake yodl
git clone https://github.com/jaeandersson/swig.git
cd swig 
git checkout 82714bf35c33fe2 
./autogen.sh 
./configure --prefix=$HOME/swig-matlab-install 
make 
make install
cd ..

# setup compiler
sudo apt-get update -qq
sudo apt-get install -y binutils gcc g++ gfortran git cmake liblapack-dev ipython python-dev python-numpy python-scipy python-matplotlib libmumps-seq-dev libblas-dev liblapack-dev libxml2-dev
sudo apt-get install -y fakeroot rpm alien

export SWIG_HOME=$HOME/swig-matlab-install 
export PATH=$SWIG_HOME/bin:$SWIG_HOME/share:$PATH
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$HOME/ipopt-install/lib/pkgconfig

# get matlab
testbot/recipes/fetch.sh matlab$MATLABRELEASE.tar.gz
mkdir matlab
tar -xf matlab$MATLABRELEASE.tar.gz -C matlab
cd ..

# compile
git clone https://github.com/casadi/casadi.git --depth=1
cd casadi
git submodule init
git submodule update
mkdir build
mkdir -p build/swig/matlab/ 
touch build/swig/matlab/SwigGet.m
cd build
cmake -DWITH_OSQP=ON -DWITH_THREAD_MINGW=ON -DWITH_THREAD=ON -DWITH_AMPL=ON -DCMAKE_BUILD_TYPE=Release -DWITH_SO_VERSION=OFF -DWITH_NO_QPOASES_BANNER=ON -DWITH_COMMON=ON -DWITH_HPMPC=ON -DWITH_BUILD_HPMPC=ON -DWITH_BLASFEO=ON -DWITH_BUILD_BLASFEO=ON -DINSTALL_INTERNAL_HEADERS=ON -DWITH_IPOPT=ON -DWITH_OPENMP=OFF -DWITH_SELFCONTAINED=ON -DCMAKE_INSTALL_PREFIX=$HOME/casadi-matlab-install -DWITH_DEEPBIND=ON -DWITH_MATLAB=ON  -DWITH_DOC=ON -DWITH_EXAMPLES=ON -DWITH_EXTRA_WARNINGS=ON ..
make VERBOSE=1
make install VERBOSE=1
