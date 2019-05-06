sudo apt-get update -qq
sudo apt-get install p7zip-full -y
sudo apt-get install bison -y
sudo apt-get install -y binutils gcc g++ gfortran git cmake liblapack-dev ipython python-dev python-numpy python-scipy python-matplotlib libmumps-seq-dev libblas-dev liblapack-dev libxml2-dev
sudo apt-get install -y fakeroot rpm alien

# METIS
wget http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/metis-5.1.0.tar.gz
tar xzf metis-5.1.0.tar.gz
cd metis-5.1.0/
make config prefix=$HOME/metis-install
make install

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

cd Mumps 
./get.Mumps
cd ..

cd ..
mkdir build
cd build
mkdir $HOME/ipopt-install
../configure coin_skip_warn_cxxflags=yes --prefix=$HOME/ipopt-install --disable-shared ADD_FFLAGS=-fPIC ADD_CFLAGS=-fPIC ADD_CXXFLAGS=-fPIC --with-blas=BUILD --with-lapack=BUILD --with-mumps=BUILD --with-metis="-L$HOME/metis-install -lmetis" --without-hsl --without-asl
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
cmake -DWITH_OSQP=OFF -DWITH_THREAD_MINGW=OFF -DWITH_THREAD=ON -DWITH_AMPL=OFF -DCMAKE_BUILD_TYPE=Release -DWITH_SO_VERSION=OFF -DWITH_NO_QPOASES_BANNER=ON -DWITH_COMMON=ON -DWITH_HPMPC=OFF -DWITH_BUILD_HPMPC=OFF -DWITH_BLASFEO=OFF -DWITH_BUILD_BLASFEO=OFF -DINSTALL_INTERNAL_HEADERS=ON -DWITH_IPOPT=ON -DWITH_OPENMP=ON -DWITH_SELFCONTAINED=ON -DCMAKE_INSTALL_PREFIX=$HOME/casadi-matlab-install -DWITH_DEEPBIND=ON -DWITH_MATLAB=OFF  -DWITH_DOC=OFF -DWITH_EXAMPLES=OFF -DWITH_EXTRA_WARNINGS=ON ..
make VERBOSE=1
make install VERBOSE=1
