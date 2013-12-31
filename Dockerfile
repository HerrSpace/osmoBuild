FROM ubuntu:12.04
MAINTAINER Patrick Meyer <space@potential-terrorist.com>

#= make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install wget

#= install ARM-Cross-compiler
RUN apt-get -y install python-software-properties
RUN add-apt-repository -y ppa:bdrung/bsprak
RUN apt-get -y install arm-elf-toolchain

#= build ARM-Cross-compiler; because packages are mainstream.
#RUN apt-get -y install git
#RUN git clone https://github.com/spaceSub/osmoBuild.git
#RUN chmod +x /osmoBuild/gccArm.bash
#RUN /osmoBuild/gccArm.bash
#env PATH /root/crossCompiler/install/bin:$PATH
#RUN ls /root/crossCompiler/install/bin

#= build osmocomBB
#RUN apt-get -y install libtool shtool autoconf git-core pkg-config make gcc
#RUN git clone git://git.osmocom.org/osmocom-bb.git
#CMD ./osmoBuild/build.bash
