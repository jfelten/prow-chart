#!/bin/bash

git clone https://github.com/bittersweet/forwardhook.git
cd forwardhook
CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o forwardhook .
cd ..
gcloud docker build . -t gcr.io/sds-readiness/forwardhook
gcloud docker push gcr.io/sds-readiness/forwardhook
rm -rf forwardhook