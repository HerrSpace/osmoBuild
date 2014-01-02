<pre>
osmoBuild
=========

Give osmcomBB what it deserves: A shitty ubuntu build enviroment.

Just run the following and you are done:

docker build -t="osmocomBBuild" .
docker run -v `pwd`:/tmp/destination osmocomBBuild
export LD_LIBRARY_PATH=`pwd`/libosmocore/src/.libs:$LD_LIBRARY_PATH

</pre>
