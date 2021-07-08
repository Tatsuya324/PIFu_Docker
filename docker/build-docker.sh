#!/bin/bash

BUILD_DIR=$(dirname $(readlink -f $0))/src

PYTORCH_IMAGE_NAME="pifu_docker:pytorch1.4.0"

docker build \
  -t ${PYTORCH_IMAGE_NAME} \
  -f ${BUILD_DIR}/Dockerfile \
  ${BUILD_DIR}