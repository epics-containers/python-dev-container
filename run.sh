#!/bin/bash

mkdir -p /scratch/${USER}/work

image=python-dev:latest
environ="-e DISPLAY"
volumes="-v /scratch/${USER}/work:/local \
        -v /scratch/projects:/global \
        -v /home/${USER}/.ssh:/home/${USER}/.ssh \
        -v /home/${USER}/.bash_history:/home/${USER}/.bash_history"
opts="--net=host --rm -ti"
x11opts="-v /dev/dri:/dev/dri --security-opt=label=type:container_runtime_t"

set -x
podman run ${path} ${environ} ${x11opts} ${volumes} ${@} ${opts} ${image}
