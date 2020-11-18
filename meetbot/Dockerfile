FROM ubuntu:18.04

# System packages
RUN apt-get update \
   && apt-get install -y --no-install-recommends curl wget build-essential yasm libtool libx264-dev libpulse-dev libfreetype6-dev swig automake autoconf liblog4cxx-dev pkg-config cmake libbz2-dev liblzma-dev zlib1g-dev libva-dev libx11-dev unzip libnss3-tools



WORKDIR /home/root
# Install miniconda to /miniconda
RUN wget --no-check-certificate https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
   && bash Miniconda3-latest-Linux-x86_64.sh -p /miniconda -b \
   && rm Miniconda3-latest-Linux-x86_64.sh \
   && export PATH=/miniconda/bin:${PATH} \
   && conda update -y conda

ENV PATH=/miniconda/bin:${PATH}

RUN wget --no-check-certificate https://github.com/mstorsjo/fdk-aac/archive/v0.1.6.tar.gz \ 
   && tar -xvf v0.1.6.tar.gz \
   && cd fdk-aac-0.1.6 \
   && ./autogen.sh \
   && ./configure \
   && make -j 4 \
   && make install \
   && cd ..

RUN wget --no-check-certificate https://github.com/FFmpeg/FFmpeg/archive/n4.3.1.tar.gz  \
   && tar -xvf n4.3.1.tar.gz --strip 1 \
   && ./configure --enable-static --disable-shared --enable-libfreetype --extra-cflags=--static --enable-gpl --enable-libpulse --enable-libx264 --enable-nonfree --enable-libfdk_aac \
   && make -j 4 && make install

RUN pip install selenium pause pynput

COPY entrypoint.sh /root
#ENTRYPOINT /root/entrypoint.sh

# PULSE_SINK=virtual_speaker ffmpeg -i http://d36uzhybn312tk.cloudfront.net/playlist_360p.m3u8 -map 0:0 -vcodec rawvideo -pix_fmt yuv420p -f v4l2 /dev/video0 -map 0:1 -f pulse "out-sb"

RUN rm -rf /home/root/*
RUN apt-get clean cache
