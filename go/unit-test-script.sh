#!/bin/bash

set -e -u -x

export GOPATH=$(pwd)/gopath
cd $GOPATH/src/$repopath
go test $(go list ./... | grep -v /vendor/) -run=\!Integration