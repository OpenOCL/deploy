set -e

if [ -z "${MATLAB_ROOT}" ]; then
   echo "You need to set MATLAB_ROOT environment variable to directory of your Matlab installation."
   exit 1
fi

sudo apt-get update -qq
sudo apt-get install p7zip-full -y
sudo apt-get install bison -y
sudo apt-get install -y binutils gcc g++ gfortran git cmake liblapack-dev ipython
sudo apt-get install -y python-dev python-numpy python-scipy python-matplotlib libmumps-seq-dev
sudo apt-get install -y libblas-dev liblapack-dev libxml2-dev
sudo apt-get install -y fakeroot rpm alien

rm -rf $HOME/build-casadi-linux-matlab
mkdir $HOME/build-casadi-linux-matlab
cd $HOME/build-casadi-linux-matlab

# get ipopt
wget http://www.coin-or.org/download/source/Ipopt/Ipopt-3.12.3.tgz
tar -xf Ipopt-3.12.3.tgz
cd Ipopt-3.12.3
cd ThirdParty

cd Metis
./get.Metis
cd ..

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
mkdir $HOME/build-casadi-linux-matlab/ipopt-install
../configure coin_skip_warn_cxxflags=yes --prefix=$HOME/build-casadi-linux-matlab/ipopt-install \
    --disable-shared ADD_FFLAGS=-fPIC ADD_CFLAGS=-fPIC ADD_CXXFLAGS=-fPIC --with-blas=BUILD \
    --with-lapack=BUILD --with-mumps=BUILD --with-metis=BUILD --without-hsl --without-asl
make -j4
make install
cd ..
cd ..

rm Ipopt-3.12.3.tgz
rm -rf Ipopt-3.12.3

# swig matlab
sudo apt-get install -y libpcre3-dev automake yodl
git clone --depth=1 https://github.com/jaeandersson/swig.git
cd swig
./autogen.sh
./configure --prefix=$HOME/build-casadi-linux-matlab/swig-install
make -j4
make install
cd ..

rm -rf swig

# setup compiler
export SWIG_HOME=$HOME/build-casadi-linux-matlab/swig-install
export PATH=$SWIG_HOME/bin:$SWIG_HOME/share:$PATH
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$HOME/build-casadi-linux-matlab/ipopt-install/lib/pkgconfig

# compile
git clone https://github.com/casadi/casadi.git --depth=1
cd casadi
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$HOME/build-casadi-linux-matlab/casadi-install -DWITH_OSQP=OFF \
    -DWITH_THREAD_MINGW=OFF -DWITH_THREAD=ON -DWITH_AMPL=OFF -DCMAKE_BUILD_TYPE=Release \
    -DWITH_SO_VERSION=OFF -DWITH_NO_QPOASES_BANNER=ON -DWITH_COMMON=ON -DWITH_HPMPC=OFF \
    -DWITH_BUILD_HPMPC=OFF -DWITH_BLASFEO=OFF -DWITH_BUILD_BLASFEO=OFF -DINSTALL_INTERNAL_HEADERS=ON \
    -DWITH_IPOPT=ON -DWITH_OPENMP=ON -DWITH_SELFCONTAINED=ON -DWITH_DEEPBIND=ON -DWITH_MATLAB=ON \
    -DWITH_DOC=OFF -DWITH_EXAMPLES=OFF -DWITH_EXTRA_WARNINGS=ON ..
make -j4
make install

cd ..
cd ..
rm -r casadi

export datestr=$(date +"%Y%m%d%H%M%")
zip -r casadi-3.4.5-linux-matlab-ipopt-minimal-${datestr}.zip casadi-install

cd $HOME
cp $HOME/build-casadi-linux-matlab/casadi-3.4.5-linux-matlab-ipopt-minimal-${datestr}.zip .
