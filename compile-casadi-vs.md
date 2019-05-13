## install MinGW

http://www.mingw.org/wiki/Getting_Started

https://osdn.net/projects/mingw/downloads/68260/mingw-get-setup.exe

Select msys to install

## install dtk

https://sourceforge.net/projects/mingw/files/Other/Unsupported/MSYS/msysDTK/msysDTK-1.0.1/

Install into MinGW/msys/1.0 directory.

## Install pcre

Get developer files from:

http://gnuwin32.sourceforge.net/packages/pcre.htm

## Compile SWIG Matlab

Start msys (version 1.0.11). 

```
export CFLAGS="-I$HOME/pcre/include"
export LDFLAGS="-L$HOME/pcre/lib"
git clone --depth=1 https://github.com/jaeandersson/swig.git swig_matlab
cd swig_matlab
./autogen
./configure --prefix=$HOME/swig-install CXXFLAGS="-I$HOME/pcre/include -L$HOME/pcre/lib"
```

## Install Matlab


## Compile Ipopt

Get blas, lapack, metis, mumps

``` export CC=D:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.20.27508\bin\Hostx64\x64```

``` ./configure --enable-doscompile=msvc --width-blas=$HOME/Ipopt/ThirdParty/Blas```

```./configure --enable-doscompile=msvc```
