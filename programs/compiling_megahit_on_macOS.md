# Install MEGAHIT on MacOS

In MacOS, `gcc` and `g++` are simlink to Apple Clang which does not have OpenMP. We had to manually install and then compile.

We followed steps from this reference: https://github.com/fritzsedlazeck/Sniffles/issues/136#issuecomment-476647934

First, Installed zlib, cmake >= 2.8, gzip and bzip2.
Then, `brew install gcc`. It will create  `gcc-ver` and `g++-ver` with a version number in `/usr/local/bin` so that they do not conflict with MacOS default gcc/g++. The two new versioned gcc/g++ have OpemMP by default. Finally we can compile MEGAHIT by telling cmake where the real gcc and g++ are, using `-D CMAKE_C_COMPILER=/usr/local/bin/gcc-ver -D CMAKE_CXX_COMPILER=/usr/local/bin/g++-ver` (replace the `ver` with real installed version number).

We used the following commands to compile MEGAHIT.
```sh
git clone https://github.com/voutcn/megahit.git
cd megahit
git submodule update --init
mkdir build && cd build
cmake .. -D CMAKE_C_COMPILER=/usr/local/bin/gcc-14 -D CMAKE_CXX_COMPILER=/usr/local/bin/g++-14 -D CMAKE_BUILD_TYPE=Release
make -j4
```

