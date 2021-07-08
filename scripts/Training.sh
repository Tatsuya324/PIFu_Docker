#!/bin/bash

CONTAINER_CMD="python -m PIFu.apps.train_shape --dataroot ./train_data --random_flip --random_scale --random_trans
"


CONTAINER_NAME="pifu_docker"
DOCKER_IMAGE="pifu_docker:Training"

HOST_WS=$(dirname $(dirname $(readlink -f $0)))/shared_dir

DOCKER_VOLUME="${DOCKER_VOLUME} -v ${HOST_WS}:/home/pifu-docker:rw"
DOCKER_VOLUME="${DOCKER_VOLUME} -v /etc/group:/etc/group:ro"
DOCKER_VOLUME="${DOCKER_VOLUME} -v /etc/passwd:/etc/passwd:ro"

DOCKER_ENV="${DOCKER_ENV} -e HOME=/home/pifu-docker"
DOCKER_ENV="-e USER_ID=$(id -u)"

docker run --rm \
  --gpus all \
  --privileged \
  --name ${CONTAINER_NAME} \
  --user "$(id -u $USER):$(id -g $USER)" \
  ${DOCKER_ENV} \
  ${DOCKER_VOLUME} \
  ${DOCKER_IMAGE} \
  ${CONTAINER_CMD}
  