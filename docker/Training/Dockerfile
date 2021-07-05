FROM pytorch/pytorch:1.9.0-cuda11.1-cudnn8-runtime

RUN sed -i 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list

LABEL maintainer="tatsuyaokazaki"

SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir -p /home/pufu 

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
        python3-pip \
        python3-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/embree/embree/releases/download/v2.17.7/embree-2.17.7.x86_64.linux.tar.gz -O /tmp/embree.tar.gz -nv
RUN tar -xzf /tmp/embree.tar.gz --strip-components=1 -C /usr/local
RUN rm -rf /tmp/embree.tar.gz

RUN pip3 install --no-cache-dir \
    Pillow \
    scikit-image \
    tqdm \
    numpy \
    opencv-contrib-python==4.4.0.46 \
    trimesh \ 
    cython \
    pyexr \
    PyOpenGL 

RUN pip3 install --no-cache-dir https://github.com/scopatz/pyembree/releases/download/0.1.6/pyembree-0.1.6.tar.gz

RUN echo "PYTHONIOENCODING=utf-8" >> /root/.bashrc && \
    echo "TF_CPP_MIN_LOG_LEVEL=2" >> /root/.bashrc && \
    echo "export PS1='\[\033[01;32m\]PIFu@docker\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> /root/.bashrc
    
WORKDIR /home/pufu