FROM pytorch/pytorch:1.4-cuda10.1-cudnn7-runtime

RUN sed -i 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list

LABEL maintainer="tatsuyaokazaki"

SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir -p /home/pifu-docker 

RUN apt-get update && \
    apt-get install -y \
        sudo \
        bash-completion \
        wget \
        git \
        nano \
        freeglut3-dev \
        libgl1-mesa-dri \
        libegl1-mesa \
        libgbm1 \
        libopenexr-dev \
        libopencv-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install\
    cython \
    pyexr \
    rtree 

RUN pip install \
    cycler==0.10.0 \
    decorator==4.4.1 \
    imageio==2.8.0 \
    kiwisolver==1.1.0 \
    matplotlib==3.1.3 \
    networkx==2.4 \
    numpy==1.18.1 \
    opencv-python==4.2.0.32 \
    pathlib==1.0.1 \
    Pillow==8.1.1 \
    PyOpenGL==3.1.5 \
    pyparsing==2.4.6 \
    python-dateutil==2.8.1 \
    PyWavelets==1.1.1 \
    scikit-image==0.16.2 \
    scipy==1.4.1 \
    Shapely==1.7.0 \
    six==1.14.0 \
    tqdm==4.43.0 \
    trimesh==3.5.23 \
    xxhash==1.4.3


RUN wget https://github.com/embree/embree/releases/download/v2.17.7/embree-2.17.7.x86_64.linux.tar.gz -O /tmp/embree.tar.gz -nv && \
    tar -xzf /tmp/embree.tar.gz --strip-components=1 -C /usr/local && \
    rm -rf /tmp/embree.tar.gz && \
    pip install --no-cache-dir https://github.com/scopatz/pyembree/releases/download/0.1.6/pyembree-0.1.6.tar.gz


RUN echo "PYTHONIOENCODING=utf-8" >> /root/.bashrc && \
    echo "TF_CPP_MIN_LOG_LEVEL=2" >> /root/.bashrc && \
    echo "export PS1='\[\033[01;32m\]PIFu@docker\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> /root/.bashrc
        
WORKDIR /home/pifu-docker
