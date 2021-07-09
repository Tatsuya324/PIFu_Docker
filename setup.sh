#!/bin/bash

SETUP_DIR=$(dirname $(readlink -f $0))

if [ -d ${SETUP_DIR}/shared_dir/PIFu ]; then
    echo "PIFuリポジトリの存在を確認しました。"
    echo "Dockerイメージが存在する可能性があるため、BUILDを行いません。"
else
    echo "PIFuリポジトリが見つかりません。GitHubよりCloneします。"
    git clone https://github.com/shunsukesaito/PIFu.git ${SETUP_DIR}/shared_dir/PIFu
    echo "DockerイメージのBUILDを行います。"
    
    BUILD_DIR=${SETUP_DIR}/docker/src/DataGeneration

    PYTORCH_IMAGE_NAME="pifu_docker_datageneration:nvidia-cuda11.4.0-runtime-ubuntu20.04"

    docker build \
    -t ${PYTORCH_IMAGE_NAME} \
    -f ${BUILD_DIR}/Dockerfile \
    ${BUILD_DIR}

    echo "DataGeneration用のDocker環境をBUILDしました。"

    BUILD_DIR=${SETUP_DIR}/docker/src/Training

    PYTORCH_IMAGE_NAME="pifu_docker_training:pytorch-pytorch1.4-cuda10.1-cudnn7-runtime"

    docker build \
    -t ${PYTORCH_IMAGE_NAME} \
    -f ${BUILD_DIR}/Dockerfile \
    ${BUILD_DIR}

    echo "Training用のDocker環境をBUILDしました。"
fi