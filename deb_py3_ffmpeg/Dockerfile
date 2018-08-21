FROM continuumio/miniconda3


RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential yasm libtool libx264-dev libfreetype6-dev swig automake autoconf liblog4cxx-dev pkg-config cmake libbz2-dev liblzma-dev zlib1g-dev libva-dev libx11-dev

RUN pip install flask flask-restplus gunicorn

WORKDIR /home/root
COPY v0.1.6.tar.gz /home/root/
RUN tar -xvf v0.1.6.tar.gz \
   && cd fdk-aac-0.1.6 \
   && ./autogen.sh \
   && ./configure \
   && make -j 4 \
   && make install \
   && cd ..

COPY n4.0.1.tar.gz /home/root/
RUN  tar -xvf n4.0.1.tar.gz --strip 1 \
   && ./configure --enable-static --disable-shared --enable-libfreetype --extra-cflags=--static --enable-gpl --enable-libx264 --enable-nonfree --enable-libfdk_aac \
   && make -j 4 && make install

RUN rm -rf /home/root/*
RUN apt-get clean cache
