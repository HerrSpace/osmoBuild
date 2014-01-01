FROM ubuntu:12.04
MAINTAINER Patrick Meyer <space@potential-terrorist.com>

RUN apt-get -y install vim # For debugging 

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install wget



#= install ARM-Cross-compiler # Not in repo anymore??
#RUN echo "deb http://ppa.launchpad.net/bdrung/ppa/ubuntu precise main" >> /etc/apt/sources.list
#RUN gpg --keyserver pgpkeys.mit.edu --recv-key 02F53E15
#RUN gpg -a --export 02F53E15 | apt-key add -
#RUN apt-get update
#RUN apt-get -y install arm-elf-toolchain



#= build ARM-Cross-compiler; because packages are mainstream.
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main restricted universe multiverse" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install build-essential libgmp3-dev libmpfr-dev libx11-6 libx11-dev texinfo flex bison libncurses5 libncurses5-dbg libncurses5-dev libncursesw5 libncursesw5-dbg libncursesw5-dev zlibc zlib1g-dev libmpfr4 libmpc-dev info  

#== Get the source
RUN mkdir /root/crossCompiler /root/crossCompiler/src /root/crossCompiler/install /root/crossCompiler/build
RUN wget -P /root/crossCompiler/src http://ftp.gnu.org/gnu/gcc/gcc-4.5.2/gcc-4.5.2.tar.bz2
RUN wget -P /root/crossCompiler/src http://ftp.gnu.org/gnu/binutils/binutils-2.21.1a.tar.bz2
RUN wget -P /root/crossCompiler/src ftp://sources.redhat.com/pub/newlib/newlib-1.19.0.tar.gz

#== Get the build Script
RUN wget -P /root/crossCompiler http://bb.osmocom.org/trac/raw-attachment/wiki/GnuArmToolchain/gnu-arm-build.2.sh

RUN sed 's/ROOT=.*/ROOT=\/root\/crossCompiler/g' /root/crossCompiler/gnu-arm-build.2.sh > /root/crossCompiler/gnu-arm-build.2.sh.mod
RUN mv /root/crossCompiler/gnu-arm-build.2.sh.mod /root/crossCompiler/gnu-arm-build.2.sh # This is probably bogus. TODO: Can I do this with sed directly?
RUN chmod +x /root/crossCompiler/gnu-arm-build.2.sh

#== build the Compiler
RUN /root/crossCompiler/gnu-arm-build.2.sh

ENV PATH /root/crossCompiler/install/bin:$PATH
RUN ls /root/crossCompiler/install/bin



#= build osmocomBB
RUN apt-get -y install libtool shtool autoconf git-core pkg-config make gcc
CMD /tmp/destination/build.bash
