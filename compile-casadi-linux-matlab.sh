sudo apt-get install p7zip-full -y
sudo apt-get install bison -y

# setup miniconda
#wget http://repo.continuum.io/miniconda/Miniconda2-4.3.21-Linux-x86_64.sh -O miniconda.sh
#chmod +x miniconda.sh
#./miniconda.sh -b
#export PATH=$HOME/miniconda2/bin:$PATH
#conda create --quiet --yes -n casadi python=2.7 requests pyyaml libgcc
#conda install --quiet --yes -n casadi pip
#source activate casadi
#pip install --quiet pysftp
#pip install cryptography
#pip install requests==2.6.0
#pip install psutil
#pip install pyaml

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
cd ..

# setup compiler
sudo apt-get update -qq
sudo apt-get install -y binutils gcc-4.7 g++-4.7 gfortran-4.7 git cmake liblapack-dev ipython python-dev python-numpy python-scipy python-matplotlib libmumps-seq-dev libblas-dev liblapack-dev libxml2-dev
export CC=gcc-4.7
export CXX=g++-4.7
export FC=gfortran-4.7
sudo apt-get install fakeroot rpm alien

export SWIG_HOME=$HOME/build/swig_matlab
export PATH=$SWIG_HOME/bin:$SWIG_HOME/share:$PATH

export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$HOME/ipopt-install/lib/pkgconfig
cd $HOME
ln -s  $HOME/build/ipopt ipopt-install
cd ..

# compile
cd /home/travis/build/
testbot/recipes/fetch.sh matlab$MATLABRELEASE.tar.gz
mkdir matlab
tar -xf matlab$MATLABRELEASE.tar.gz -C matlab
cd ..
cd casadi
mkdir build
mkdir -p build/swig/matlab/ 
touch build/swig/matlab/SwigGet.m
cd build
export casadi_build_flags="$casadi_build_flags -DWITH_OSQP=ON -DWITH_THREAD_MINGW=ON -DWITH_THREAD=ON -DWITH_AMPL=ON -DCMAKE_BUILD_TYPE=Release -DWITH_SO_VERSION=OFF -DWITH_NO_QPOASES_BANNER=ON -DWITH_COMMON=ON -DWITH_HPMPC=ON -DWITH_BUILD_HPMPC=ON -DWITH_BLASFEO=ON -DWITH_BUILD_BLASFEO=ON -DINSTALL_INTERNAL_HEADERS=ON"
cmake -DWITH_IPOPT=ON -DWITH_OPENMP=OFF -DWITH_SELFCONTAINED=ON -DCMAKE_INSTALL_PREFIX=$MATLABPATH -DWITH_DEEPBIND=ON -DWITH_MATLAB=ON  -DWITH_DOC=ON -DWITH_EXAMPLES=ON -DWITH_EXTRA_WARNINGS=ON ..
make VERBOSE=1
make install VERBOSE=1
