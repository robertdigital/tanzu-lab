#!/bin/sh

set -e

wget https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

wget https://github.com/kubernetes-sigs/cluster-api/releases/download/v0.3.0-rc.2/clusterctl-linux-amd64

chmod +x ./clusterctl-linux-amd64

[ -d bin ] || (mkdir bin && chmod 777 bin)
mv ./clusterctl-linux-amd64 bin/clusterctl

[ -d ~/.cluster-api ] || (mkdir ~/.cluster-api && chmod 777 ~/.cluster-api)
cp ./clusterctl.yaml ~/.cluster-api
