#!/bin/bash

SETUP_DIR=$(dirname $(readlink -f $0))

if [ -e ${CLONE_DIR}/shared_dir ]; then
    echo "PIFuリポジトリの存在を確認しました。"
    echo "Dockerイメージが存在する可能性があるため、BUILDを行いません。"
else
    echo "PIFuリポジトリが見つかりません。GitHubよりCloneします。"
    git clone https://github.com/shunsukesaito/PIFu.git .${CLONE_DIR}/shared_dir/PIFu
    echo "DockerイメージのBUILDを行います。"
    .${CLONE_DIR}/docker/build-docker.sh
fi