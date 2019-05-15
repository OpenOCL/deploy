# the paths to matlab are tailored to my personal machine
OCL_VERSION=4.21

# compile casadi for linux
rm -f $HOME/casadi-3.4.5-linux-matlab-ipopt-minimal-${OCL_VERSION}.zip
export MATLAB_ROOT=$HOME/matlab
sh compile-casadi-linux-matlab.sh ${OCL_VERSION}

# compile casadi for windows
rm -f $HOME/casadi-3.4.5-win-matlab-ipopt-minimal-${OCL_VERSION}.zip
export MATLAB_ROOT=$HOME/matlab-install-R2016a
sh compile-casadi-win-matlab.sh ${OCL_VERSION}

datestr=$(date +"%Y%m%d%H%M")
mkdir $HOME/openocl-deploy-$datestr
cp README $HOME/openocl-deploy-$datestr
cd $HOME/openocl-deploy-$datestr

# get source code
git clone https://github.com/OpenOCL/OpenOCL.git openocl_repo
cd openocl_repo
git checkout-index -a -f --prefix=../openocl/
cd ..
rm -rf openocl_repo

git clone https://github.com/jaeandersson/swig.git swig_repo --depth=1
cd swig_repo
git checkout-index -a -f --prefix=../openocl/ThirdParty/swig/
cd ..
rm -rf swig_repo

git clone https://github.com/casadi/casadi.git casadi_repo --depth=1
cd casadi_repo
git checkout-index -a -f --prefix=../openocl/ThirdParty/casadi/
cd ..
rm -rf casadi_repo

cd openocl
cd ThirdParty

wget http://www.coin-or.org/download/source/Ipopt/Ipopt-3.12.3.tgz
tar -xf Ipopt-3.12.3.tgz
rm Ipopt-3.12.3.tgz
mv Ipopt-3.12.3 ipopt

mkdir blas
cd blas
../ipopt/ThirdParty/Blas/get.Blas
cd ..

mkdir lapack
cd lapack
../ipopt/ThirdParty/Lapack/get.Lapack
cd ..

mkdir mumps
cd mumps
../ipopt/ThirdParty/Mumps/get.Mumps
cd ..

mkdir metis
cd metis
../ipopt/ThirdParty/Metis/get.Metis
cd ..

cd ..
cd .. # in openocl-deploy-*

# Linux
rm -f openocl-${OCL_VERSION}-linux.zip
unzip -q $HOME/casadi-3.4.5-linux-matlab-ipopt-minimal-${OCL_VERSION}.zip
mkdir openocl/lib
cp -r casadi-install/* openocl/lib
rm -rf casadi-install

cp README openocl
zip -r -q openocl-${OCL_VERSION}-linux.zip openocl
rm -rf openocl/lib

# Windows
rm -f openocl-${OCL_VERSION}-win.zip
unzip -q $HOME/casadi-3.4.5-win-matlab-ipopt-minimal-${OCL_VERSION}.zip
mkdir openocl/lib
cp -r casadi-install/casadi/* openocl/lib
rm -rf casadi-install

cp README openocl
zip -r -q openocl-${OCL_VERSION}-win.zip openocl
rm -rf openocl/lib
