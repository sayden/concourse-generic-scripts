#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Illegal number of parameters"
    echo "You need to set at least 3 parameters"
    echo "1: Pipeline name"
    echo "2: Access password for the git repository"
    echo "3: Path of the repo in \"go get\" format like \"github.com/thehivecorporation/raccoon\""
    echo "For example:"
    echo "./start-generic-pipeline.sh a-pipeline myPassword github.com/thehivecorporation/raccoon"
fi

fly -t tutorial set-pipeline -p $1 -c go-pipeline.yml -v password=$2 -v repopath=$3