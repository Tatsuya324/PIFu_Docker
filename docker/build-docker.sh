#!/bin/bash

BUILD_DIR=$(dirname $(readlink -f $0))/src/DataGeneration

PYTORCH_IMAGE_NAME="pifu_docker_datageneration:nvidia-cuda11.4.0-runtime-ubuntu20.04"

docker build \
  -t ${PYTORCH_IMAGE_NAME} \
  -f ${BUILD_DIR}/Dockerfile \
  ${BUILD_DIR}

echo "DataGeneration用のDocker環境をBUILDしました。"

BUILD_DIR=$(dirname $(readlink -f $0))/src/Training

PYTORCH_IMAGE_NAME="pifu_docker_training:pytorch-pytorch1.4-cuda10.1-cudnn7-runtime"

docker build \
  -t ${PYTORCH_IMAGE_NAME} \
  -f ${BUILD_DIR}/Dockerfile \
  ${BUILD_DIR}

echo "Training用のDocker環境をBUILDしました。"