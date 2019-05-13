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

Start msys (version 1.0.11)

```
git clone https://github.com/jaeandersson/swig.git swig_matlab
cd swig_matlab
./autogen
./configure
```

