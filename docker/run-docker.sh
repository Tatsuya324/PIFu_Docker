#!/bin/bash

CONTAINER_NAME="pifu_docker"
DOCKER_IMAGE="pifu_docker:pytorch1.4.0"

CONTAINER_CMD="bash"

HOST_WS=$(dirname $(dirname $(readlink -f $0)))/shared_dir

DOCKER_VOLUME="${DOCKER_VOLUME} -v ${HOST_WS}:/home/pifu-docker:rw"
DOCKER_VOLUME="${DOCKER_VOLUME} -v /etc/group:/etc/group:ro"
DOCKER_VOLUME="${DOCKER_VOLUME} -v /etc/passwd:/etc/passwd:ro"
DOCKER_VOLUME="${DOCKER_VOLUME} -v /tmp/.X11-unix:/tmp/.X11-unix:rw"
DOCKER_VOLUME="${DOCKER_VOLUME} -v $HOME/.Xauthority:/root/.Xauthority:rw"

DOCKER_ENV="${DOCKER_ENV} -e HOME=/home/pifu-docker"
DOCKER_ENV="${DOCKER_ENV} -e DISPLAY=unix${DISPLAY}"
DOCKER_ENV="${DOCKER_ENV} -e TERM=xterm-256color"
DOCKER_ENV="${DOCKER_ENV} -e QT_X11_NO_MITSHM=1"


clear

printf "                                                       ■\n";
printf "\033[01;31m\n"
printf "■■■■■   ■■■  ■■■■■■              ■■■■■                 ■\n";
printf "\033[01;32m\n"
printf " ■   ■   ■    ■   ■               ■   ■■               ■\n";
printf "\033[01;33m\n"
printf " ■   ■   ■    ■      ■   ■        ■    ■   ■■■    ■■■  ■  ■■   ■■■   ■ ■■\n";
printf "\033[01;34m\n"
printf " ■   ■   ■    ■  ■   ■   ■        ■    ■  ■   ■  ■   ■ ■  ■   ■   ■  ■■\n";
printf "\033[01;35m\n"
printf " ■  ■■   ■    ■■■■   ■   ■        ■    ■■ ■   ■  ■     ■ ■    ■   ■   ■\n";
printf "\033[01;36m\n"
printf " ■■      ■    ■  ■   ■   ■   ■■   ■    ■  ■   ■■ ■     ■■■■   ■■■■    ■\n";
printf "\033[01;37m\n"
printf " ■       ■    ■      ■   ■        ■    ■  ■   ■  ■     ■■ ■   ■       ■\n";
printf "\033[01;38m\n"
printf " ■       ■    ■      ■   ■        ■   ■■  ■   ■  ■     ■   ■  ■      ■■\n";
printf "\033[01;39m\n"
printf "■■■     ■■■  ■■■      ■■ ■■      ■■■■■     ■■■    ■■■  ■■  ■■  ■■■   ■■\n";
printf "\n"
printf "\n"
printf "\033[00m\n"

xhost +local:

docker run --rm -it \
  -u root\
  --gpus all \
  --privileged \
  --name ${CONTAINER_NAME} \
  ${DOCKER_ENV} \
  ${DOCKER_VOLUME} \
  ${DOCKER_IMAGE} \
  ${CONTAINER_CMD}
  