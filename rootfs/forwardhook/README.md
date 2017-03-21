# 2 Step docker build

To build the forwardhook image first build the binary and then run docker build

		./build.sh
		docker build

###We do this to create small docker containers withou all the golang tooling
### See(https://blog.codeship.com/building-minimal-docker-containers-for-go-applications/)