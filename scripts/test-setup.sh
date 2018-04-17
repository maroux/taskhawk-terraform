#!/bin/bash

set -x

if [[ "${TRAVIS}" == "true" ]]; then
    go get github.com/fatih/hclfmt
fi
