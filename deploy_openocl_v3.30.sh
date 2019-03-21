rm -rf ./ocl_tmp
rm -rf ./archives_tmp
rm -rf ./output

mkdir archives_tmp

git clone https://github.com/OpenOCL/OpenOCL.git ocl_tmp
git checkout master

curl -o archives_tmp/linux-m.tar.gz -LO https://github.com/casadi/casadi/releases/download/3.3.0/linux__casadi-matlabR2014b-v3.3.0.tar.gz --progress-bar
# wget https://github.com/casadi/casadi/releases/download/3.3.0/linux__casadi-octave-v3.3.0.tar.gz
#
# wget https://github.com/casadi/casadi/releases/download/3.3.0/osx__casadi-matlabR2014b-v3.3.0.tar.gz
# wget https://github.com/casadi/casadi/releases/download/3.3.0/osx__casadi-matlabR2015a-v3.3.0.tar.gz
# wget https://github.com/casadi/casadi/releases/download/3.3.0/osx__casadi-octave-v3.3.0.tar.gz
#
# wget https://github.com/casadi/casadi/releases/download/3.3.0/windows__casadi-matlabR2014b-v3.3.0.zip
# wget https://github.com/casadi/casadi/releases/download/3.3.0/windows__casadi-matlabR2016a-v3.3.0.zip
# wget https://github.com/casadi/casadi/releases/download/3.3.0/windows__casadi-octave-4.2.1-w64-v3.3.0.zip

mkdir ocl_tmp/Lib
tar -zxf archives_tmp/linux-m.tar.gz -C ocl_tmp/Lib

mkdir output
tar -zcf output/openocl_v3-30_linux_matlab.tar.gz ocl_tmp


rm -rf ./ocl_tmp
rm -rf ./archives_tmp
