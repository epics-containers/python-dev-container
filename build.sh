#!/bin/bash

if which docker 2>/dev/null; then
    DOCKER=docker
else
    DOCKER=podman
fi

set -x
${DOCKER} build\
    $ARGS\
    --network host\
    -t python-dev .
