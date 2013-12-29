#!/bin/bash
#= build ARM-Cross-compiler; because packages are mainstream.

cd /root/
mkdir crossCompiler && cd crossCompiler

apt-get update
apt-get -y install build-essential libgmp3-dev libmpfr-dev libx11-6 libx11-dev texinfo flex bison libncurses5 libncurses5-dbg libncurses5-dev libncursesw5 libncursesw5-dbg libncursesw5-dev zlibc zlib1g-dev libmpfr4 libmpc-dev 

#== Get the build Script
wget http://bb.osmocom.org/trac/raw-attachment/wiki/GnuArmToolchain/gnu-arm-build.2.sh
chmod +x gnu-arm-build.2.sh
mkdir build install src

#== Get the source
cd src/
wget http://ftp.gnu.org/gnu/gcc/gcc-4.5.2/gcc-4.5.2.tar.bz2
wget http://ftp.gnu.org/gnu/binutils/binutils-2.21.1a.tar.bz2
wget ftp://sources.redhat.com/pub/newlib/newlib-1.19.0.tar.gz
cd ..

#== build
./gnu-arm-build.2.sh 

