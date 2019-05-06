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



export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$HOME/ipopt-install/lib/pkgconfig
cd $HOME
ln -s  $HOME/build/ipopt ipopt-install
cd ..
export casadi_build_flags="$casadi_build_flags -DWITH_IPOPT=ON"    

