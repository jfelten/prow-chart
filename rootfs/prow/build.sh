#!/bin/bash

#this tool is meant to be built with bazel - brew install bazel

COMPONENTS=( crier deck hook horologium plank sinker splice tot )

export GOPATH=`pwd`
WORKSPACE_DIR=src/k8s.io
rm -rf $WORKSPACE_DIR
mkdir -p $WORKSPACE_DIR
cd $WORKSPACE_DIR
git clone https://github.com/jfelten/test-infra.git
cd test-infra/prow
git checkout trusted_config
make
for component in "${COMPONENTS[@]}"
do
   : 
    cd $GOPATH/$WORKSPACE_DIR/test-infra/prow/cmd/${component}
	CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o ${component}
	docker build . -t jfelten/${component}
	docker push jfelten/${component}
done

cd $GOPATH
rm -rf src pkg bin