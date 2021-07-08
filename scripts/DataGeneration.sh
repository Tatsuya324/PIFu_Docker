#!/bin/bash

CONTAINER_NAME="pifu_docker_DataGeneration"
DOCKER_IMAGE="pifu_docker_DataGeneration:nvidia/cuda11.4.0-runtime-ubuntu20.04"

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
  /bin/bash -c "cd PIFu && python3 -m apps.prt_util -i ../raw_data && python3 -m apps.render_data -i ../raw_data -o ../train_data -e"