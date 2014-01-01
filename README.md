osmoBuild
=========

Give osmcomBB what it deserves: A shitty ubuntu build enviroment.

Just run the following and you are done:

docker build -t="osmocomBBuild" .
docker run -v `pwd`:/tmp/destination osmocomBBuild
