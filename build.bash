#!/bin/bash
#= build osmocomBB

cd /tmp/destination

if [ ! -d "osmocom-bb" ]; then
	git clone git://git.osmocom.org/osmocom-bb.git
else
	cd osmocom-bb/
	git pull --rebase
	cd ..
fi


if [ ! -d "libosmocore" ]; then
	git clone git://git.osmocom.org/libosmocore.git
else
	cd libosmocore/
	git pull --rebase
	cd ..
fi

cd libosmocore/
autoreconf -i
./configure
make
make install
cd ../


cd osmocom-bb/src/
make
