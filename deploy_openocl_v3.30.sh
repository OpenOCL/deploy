
git clone https://github.com/OpenOCL/OpenOCL.git
git checkout tags/v3.30

wget https://github.com/casadi/casadi/releases/download/3.3.0/linux__casadi-matlabR2014b-v3.3.0.tar.gz
wget https://github.com/casadi/casadi/releases/download/3.3.0/linux__casadi-octave-v3.3.0.tar.gz

wget https://github.com/casadi/casadi/releases/download/3.3.0/osx__casadi-matlabR2014b-v3.3.0.tar.gz
wget https://github.com/casadi/casadi/releases/download/3.3.0/osx__casadi-matlabR2015a-v3.3.0.tar.gz
wget https://github.com/casadi/casadi/releases/download/3.3.0/osx__casadi-octave-v3.3.0.tar.gz

wget https://github.com/casadi/casadi/releases/download/3.3.0/windows__casadi-matlabR2014b-v3.3.0.zip
wget https://github.com/casadi/casadi/releases/download/3.3.0/windows__casadi-matlabR2016a-v3.3.0.zip
wget https://github.com/casadi/casadi/releases/download/3.3.0/windows__casadi-octave-4.2.1-w64-v3.3.0.zip

tar xvcf linux__casadi-matlabR2014b-v3.3.0.tar.gz -C linux14b

cd openocl
mkdir bin
cd bin

cp ../../linux14b/libcasadi.so . 



