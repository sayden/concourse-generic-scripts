#!/bin/sh

set -e

# task script is in resource-tutorial/10_job_inputs/ folder
# application input is in gopath/src/github.com/cloudfoundry-community/simple-go-web-app folder
# $GOPATH is gopath/ folder
export GOPATH=$(pwd)/gopath
cd $GOPATH/src/github.com/thehivecorporation/raccoon/

go test $(go list ./... | grep -v /vendor/) -run=\!Integration