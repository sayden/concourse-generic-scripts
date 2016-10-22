#!/bin/bash

set -e -u -x

export GOPATH=$(pwd)/gopath
cd $GOPATH/src/$repopath
apt-get update
apt-get install -y openssh-server
mkdir /var/run/sshd
echo 'root:root' | chpasswd
sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
/usr/sbin/sshd
go test $(go list ./... | grep -v /vendor/) -v -run=\Integration