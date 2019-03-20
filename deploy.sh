# get casadi source code
git clone https://github.com/casadi/casadi.git

# build casadi for linux
cd casadi
mkdir build
cd build
export CC = clang++
cmake -DWITH_OPENMP=ON -DWITH_EXTRA_WARNINGS=ON -DWITH_EXTRA_CHECKS=ON -DWITH_PROFILING=ON -DWITH_DOC=ON -DWITH_EXAMPLES=ON -DWITH_COVERAGE=ON -DWITH_EXTRA_WARNINGS=ON -DWITH_JSON=ON -DWITH_BLASFEO=ON -DWITH_BUILD_BLASFEO=ON -DWITH_HPMPC=ON -DWITH_BUILD_HPMPC=ON ..


