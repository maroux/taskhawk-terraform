#!/bin/bash

set -x

if [[ "${TRAVIS}" == "true" ]]; then
    hclfmt .
    if [ "$?" -ne "0" ]; then
        echo "Code not properly formatted. Run 'hclfmt -w'"
        exit 1
    fi
fi
