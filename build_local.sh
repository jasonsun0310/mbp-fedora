#!/bin/bash

set -eu -o pipefail

# DOCKER_IMAGE=fedora:32
DOCKER_IMAGE=fedora_iso:32
LIVECD_CACHE_PATH=/var/cache/live

docker pull ${DOCKER_IMAGE}
docker run \
  --privileged \
  --rm \
  -t \
  -v "$(pwd)":/repo \
  -v /dev:/dev \
  -v ${LIVECD_CACHE_PATH}:${LIVECD_CACHE_PATH} \
  ${DOCKER_IMAGE} \
  /bin/bash -c 'cd /repo && ./build.sh'
