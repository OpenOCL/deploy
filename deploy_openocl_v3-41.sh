rm -rf ./ocl_tmp
rm -rf ./archives_tmp
rm -rf ./output

mkdir archives_tmp
mkdir output

git clone https://github.com/OpenOCL/OpenOCL.git ocl_tmp
git checkout master

curl -o archives_tmp/linux_matlab2014b.tar.gz -LO https://github.com/casadi/casadi/releases/download/3.3.0/linux__casadi-matlabR2014b-v3.3.0.tar.gz --progress-bar
mkdir ocl_tmp/Lib
tar -zxf archives_tmp/linux_matlab2014b.tar.gz -C ocl_tmp/Lib
tar -zcf output/openocl_v3-41_linux_matlab2014b.tar.gz -C ocl_tmp .
rm -rf ./ocl_tmp/Lib

curl -o archives_tmp/linux_octave_4-2-1.tar.gz -LO https://github.com/casadi/casadi/releases/download/3.3.0/linux__casadi-octave-v3.3.0.tar.gz --progress-bar
mkdir ocl_tmp/Lib
tar -zxf archives_tmp/linux_octave_4-2-1.tar.gz -C ocl_tmp/Lib
tar -zcf output/openocl_v3-41_linux_octave_4-2-1.tar.gz -C ocl_tmp .
rm -rf ./ocl_tmp/Lib

curl -o archives_tmp/osx_matlab2014b.tar.gz -LO https://github.com/casadi/casadi/releases/download/3.3.0/osx__casadi-matlabR2014b-v3.3.0.tar.gz --progress-bar
mkdir ocl_tmp/Lib
tar -zxf archives_tmp/osx_matlab2014b.tar.gz -C ocl_tmp/Lib
tar -zcf output/openocl_v3-41_osx_matlab2014b.tar.gz -C ocl_tmp .
rm -rf ./ocl_tmp/Lib

curl -o archives_tmp/osx_matlab2015a.tar.gz -LO https://github.com/casadi/casadi/releases/download/3.3.0/osx__casadi-matlabR2015a-v3.3.0.tar.gz --progress-bar
mkdir ocl_tmp/Lib
tar -zxf archives_tmp/osx_matlab2015a.tar.gz -C ocl_tmp/Lib
tar -zcf output/openocl_v3-41_osx_matlab2015a.tar.gz -C ocl_tmp .
rm -rf ./ocl_tmp/Lib

curl -o archives_tmp/osx_octave_4-2-1.tar.gz -LO https://github.com/casadi/casadi/releases/download/3.3.0/osx__casadi-octave-v3.3.0.tar.gz --progress-bar
mkdir ocl_tmp/Lib
tar -zxf archives_tmp/osx_octave_4-2-1.tar.gz -C ocl_tmp/Lib
tar -zcf output/openocl_v3-41_osx_octave_4-2-1.tar.gz -C ocl_tmp .
rm -rf ./ocl_tmp/Lib

curl -o archives_tmp/win64_matlab2014b.zip -LO https://github.com/casadi/casadi/releases/download/3.3.0/windows__casadi-matlabR2014b-v3.3.0.zip --progress-bar
mkdir ocl_tmp/Lib
unzip -q archives_tmp/win64_matlab2014b.zip -d ocl_tmp/Lib
cd ocl_tmp/
zip -r -q -X ../output/openocl_v3-41_win64_matlab2014b.zip *
cd ..
rm -rf ./ocl_tmp/Lib

curl -o archives_tmp/win64_matlab2016a.zip -LO https://github.com/casadi/casadi/releases/download/3.3.0/windows__casadi-matlabR2016a-v3.3.0.zip --progress-bar
mkdir ocl_tmp/Lib
unzip -q archives_tmp/win64_matlab2016a.zip -d ocl_tmp/Lib
cd ocl_tmp/
zip -r -q -X ../output/openocl_v3-41_win64_matlab2016a.zip *
cd ..
rm -rf ./ocl_tmp/Lib

curl -o archives_tmp/win64_octave_4-2-1.zip -LO https://github.com/casadi/casadi/releases/download/3.3.0/windows__casadi-octave-4.2.1-w64-v3.3.0.zip --progress-bar
mkdir ocl_tmp/Lib
unzip -q archives_tmp/win64_octave_4-2-1.zip -d ocl_tmp/Lib
cd ocl_tmp/
zip -r -q -X ../output/openocl_v3-41_win64_octave_4-2-1.zip *
cd ..
rm -rf ./ocl_tmp/Lib

rm -rf ./ocl_tmp
rm -rf ./archives_tmp
