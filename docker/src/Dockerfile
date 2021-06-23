ARG PYTORCH_VERSION="1.7.1"
ARG CUDA_VERSION="11.0"
ARG CUDNN_VERSION="8"
ARG IMAGE_FLAVOR="devel"

FROM pytorch/pytorch:${PYTORCH_VERSION}-cuda${CUDA_VERSION}-cudnn${CUDNN_VERSION}-${IMAGE_FLAVOR}

RUN sed -i 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list

LABEL maintainer="tatsuya_okazaki"

SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir -p /home/pytorch

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        sudo \
        build-essential \
        pkg-config \
        wget \
        git \
        curl \
        less \
        nano \
        tmux \
        bash-completion \
        software-properties-common \
        xdg-user-dirs \
        xsel \
        dirmngr \
        gpg-agent \
        mesa-utils \
        libglu1-mesa-dev \
        libgles2-mesa-dev \
        freeglut3-dev \
        libcanberra-gtk-module \
        libcanberra-gtk3-module \
        python3-pip \
        python3-dev \
        gfortran \
        libopenblas-dev \
        libhdf5-serial-dev \
        hdf5-tools \
        libhdf5-dev \
        zlib1g-dev \
        zip \
        libpng-dev \
        libfreetype6-dev \
        libopenmpi-dev \
        libopenexr-dev \
        openexr \
        zlib1g-dev \
        libjpeg8-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "PYTHONIOENCODING=utf-8" >> /root/.bashrc && \
    echo "TF_CPP_MIN_LOG_LEVEL=2" >> /root/.bashrc && \
    echo "export PS1='\[\033[01;32m\]pytorch@docker\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> /root/.bashrc

RUN pip3 install \
        setuptools \
        Cython \
        wheel --verbose

RUN wget https://github.com/embree/embree/releases/download/v2.17.7/embree-2.17.7.x86_64.linux.tar.gz -O /tmp/embree.tar.gz -nv

RUN tar -xzf /tmp/embree.tar.gz --strip-components=1 -C /usr/local

RUN rm -rf /tmp/embree.tar.gz

RUN pip3 install \
        --no-cache-dir https://github.com/scopatz/pyembree/releases/download/0.1.6/pyembree-0.1.6.tar.gz

RUN pip3 install \
        Pillow --verbose \
        scikit-image --verbose \
        tqdm --verbose \
        numpy --verbose \
        opencv-contrib-python==4.4.0.46 --verbose \
        trimesh --verbose \
        pyexr --verbose \
        PyOpenGL --verbose \
        PyOpenGL_accelerate --verbose

WORKDIR /home/pytorch
