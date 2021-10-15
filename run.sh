#!/bin/bash

if [ -f /scratch ]; then 
   workdir=/scratch/${USER}/work
else
   workdir=/home/${USER}/work
fi

mkdir -p ${workdir}
echo "Using ${workdir}"

image=python-dev:latest
environ="-e DISPLAY"
volumes="-v ${workdir}:/local \
        -v /home/${USER}/.ssh:/home/${USER}/.ssh \
        -v /home/${USER}/.bash_history:/home/${USER}/.bash_history"
opts="--net=host --rm -ti"
x11opts="-v /dev/dri:/dev/dri --security-opt=label=type:container_runtime_t"

set -x
podman run ${path} ${environ} ${x11opts} ${volumes} ${@} ${opts} ${image}
