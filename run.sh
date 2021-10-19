#!/bin/bash

if [ -d /scratch ]; then 
   workdir=/scratch/${USER}/work
else
   workdir=/home/${USER}/work
fi

mkdir -p ${workdir}
echo "Using ${workdir}"

image=python-dev:latest
environ="-e DISPLAY -e HOME"
volumes="-v ${workdir}:/local \
        -v ${HOME}:${HOME}"
opts="--net=host --rm -ti"
x11opts="-v /dev/dri:/dev/dri --security-opt=label=type:container_runtime_t"
identity="--security-opt=label=type:container_runtime_t --annotation run.oci.keep_original_groups=1 --userns=keep-id"

set -x
podman run ${path} ${environ} ${identity} ${x11opts} ${volumes} ${@} ${opts} ${image}
