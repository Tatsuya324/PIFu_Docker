#!/bin/bash

BUILD_DIR=$(dirname $(readlink -f $0))/src/DataGeneration

PYTORCH_IMAGE_NAME="pifu_docker:DataGeneration"

docker build \
  -t ${PYTORCH_IMAGE_NAME} \
  -f ${BUILD_DIR}/Dockerfile \
  ${BUILD_DIR}

echo "DataGeneration用のDocker環境をBUILDしました。"

BUILD_DIR=$(dirname $(readlink -f $0))/src/Training

PYTORCH_IMAGE_NAME="pifu_docker:Training"

docker build \
  -t ${PYTORCH_IMAGE_NAME} \
  -f ${BUILD_DIR}/Dockerfile \
  ${BUILD_DIR}

echo "Training用のDocker環境をBUILDしました。"