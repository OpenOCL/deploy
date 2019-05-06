# ipopt
VERSION=3.12.3
wget http://www.coin-or.org/download/source/Ipopt/Ipopt-$VERSION.tgz
tar -xvf Ipopt-$VERSION.tgz

cd ThirdParty
cd Blas 
./get.Blas
cd Lapack 
./get.Lapack
cd Metis 
./get.Metis
cd Mumps 
./get.Mumps && popd
cd ..

# required for modern x86_64-w64-mingw32-pkg-config
find . -type f -name "*" -exec sed -i'' -e 's/PKG_CONFIG_PATH/PKG_CONFIG_LIBDIR/g' {} +

mkdir build
cd build
mkdir $HOME/ipopt-install
../configure $FLAGS --prefix=$HOME/ipopt-install --disable-shared ADD_FFLAGS=-fPIC ADD_CFLAGS=-fPIC ADD_CXXFLAGS=-fPIC --with-blas=BUILD --with-lapack=BUILD --with-mumps=BUILD --with-metis=BUILD --without-hsl --without-asl
make
make install

tar -zcvf ipopt.tar.gz -C $HOME/ipopt-install .

# swig matlab
sudo apt-get install -y libpcre3-dev automake yodl
cd restricted 
git clone https://github.com/jaeandersson/swig.git
cd swig 
git checkout $BAKEVERSION 
./autogen.sh 
./configure --prefix=$mypwd/swig-matlab-install 
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
cmake -DWITH_IPOPT=ON -DWITH_OPENMP=OFF -DWITH_SELFCONTAINED=ON -DCMAKE_INSTALL_PREFIX=$MATLABPATH -DWITH_DEEPBIND=ON -DWITH_MATLAB=ON  -DWITH_DOC=ON -DWITH_EXAMPLES=ON -DWITH_EXTRA_WARNINGS=ON ..
make VERBOSE=1
make install VERBOSE=1
