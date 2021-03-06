#!/bin/bash

go install ..
test $? -eq 0 || exit 1

for t in tests/*.yml; do
    kubernetes-ipfs $t
    if [ $? -ne 0 ]; then
        exit 1
    fi
done
