## install MinGW

http://www.mingw.org/wiki/Getting_Started

https://osdn.net/projects/mingw/downloads/68260/mingw-get-setup.exe

## install dtk

https://sourceforge.net/projects/mingw/files/Other/Unsupported/MSYS/msysDTK/msysDTK-1.0.1/

## Compile SWIG Matlab

Start msys (version 1.0.11)

```
git clone https://github.com/jaeandersson/swig.git swig_matlab
cd swig_matlab
./autogen
./configure
```

