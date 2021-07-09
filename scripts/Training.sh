#!/bin/bash

CONTAINER_NAME="pifu_docker_training"
DOCKER_IMAGE="pifu_docker_training:pytorch-pytorch1.4-cuda10.1-cudnn7-runtime"

if [ $1 ]; then
  HOST_WS=$1
else
  HOST_WS=$(dirname $(dirname $(readlink -f $0)))/shared_dir
fi

DOCKER_VOLUME="${DOCKER_VOLUME} -v ${HOST_WS}:/home/pifu-docker:rw"
DOCKER_VOLUME="${DOCKER_VOLUME} -v /etc/group:/etc/group:ro"
DOCKER_VOLUME="${DOCKER_VOLUME} -v /etc/passwd:/etc/passwd:ro"

DOCKER_ENV="${DOCKER_ENV} -e HOME=/home/pifu-docker"

docker run --rm -it\
  --gpus all \
  --privileged \
  --name ${CONTAINER_NAME} \
  --user "$(id -u $USER):$(id -g $USER)" \
  ${DOCKER_ENV} \
  ${DOCKER_VOLUME} \
  ${DOCKER_IMAGE} \
  /bin/bash -c "cd PIFu && python -m apps.train_shape --dataroot ../train_data --random_flip --random_scale --random_trans"