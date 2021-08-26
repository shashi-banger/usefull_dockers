FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && apt-get install -y \
    software-properties-common \
    build-essential \
    checkinstall \
    cmake \
    make \
    pkg-config \
    yasm \
    git \
    vim \
    curl \
    wget \
    sudo \
    apt-transport-https \
    libcanberra-gtk-module \
    libcanberra-gtk3-module \
    dbus-x11 \
    iputils-ping \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-numpy \
    libjpeg8-dev \
    libpng-dev \
    libtiff5-dev \
    libtiff-dev \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    libdc1394-22-dev \
    libxine2-dev \
    libavfilter-dev  \
    libavutil-dev \
    ffmpeg

# BUild Open CV
RUN git clone --depth 1 --branch 4.5.3 https://github.com/opencv/opencv.git /root/opencv/ \
    && git clone --depth 1 --branch 4.5.3 https://github.com/opencv/opencv_contrib.git /root/opencv_contrib/ \
    && cd /root/opencv/  \
    && mkdir build && cd build \
    && cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local  -D OPENCV_GENERATE_PKGCONFIG=ON  -D OPENCV_EXTRA_MODULES_PATH=/root/opencv_contrib/modules ../ \
    && make -j 4 \
    && make install \
    && cd /root/

# Build Decord
RUN git clone --recursive https://github.com/dmlc/decord /root/decord
RUN cd /root/decord \
    && mkdir build \
    && cd build \
    && cmake .. -DCMAKE_BUILD_TYPE=Release \
    && make -j2 && cd ../python && python3 setup.py install

# Build Hecate
RUN git clone https://github.com/yahoo/hecate.git /root/hecate/ \
    && cd /root/hecate/ \
    && sed -i 's/include$/include\/opencv4/g' Makefile.config \
    && make all && make distribute \
    && cp ./distribute/bin/hecate /usr/local/bin/ \
    && cp -rf ./distribute/include/hecate/ /usr/local/include/ \
    && cp -rf ./distribute/lib/* /usr/local/lib/

ENV LD_LIBRARY_PATH="/usr/local/lib/"

RUN apt-get clean && rm -rf /root/* /tmp/* /var/tmp/* /var/lib/apt/lists/* && apt-get -y autoremove

