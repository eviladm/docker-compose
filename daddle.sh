#!/bin/sh

if [ -f ./VERSION ] && [ $(grep FROM ./Dockerfile >/dev/null 2>&1;echo $?) == 0 ]; then
    echo yes
fi
