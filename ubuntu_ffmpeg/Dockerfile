FROM ubuntu:16.04

WORKDIR /home/root
COPY ffmpeg_4.02_release.tgz libx264-152_0.152.2854+gite9a5903-2_amd64.deb /home/root/
RUN apt-get update && apt-get install -y --no-install-recommends \
    && apt-get -y upgrade python-pip \
    && dpkg -i libx264-152_0.152.2854+gite9a5903-2_amd64.deb \
    && tar -zxvf ffmpeg_4.02_release.tgz --strip 1 -C / \
    && apt-get install -y libfdk-aac-dev libxv1 libxcb-shm0 libxcb-shape0 libxcb-xfixes0 libasound2 libsdl2-2.0-0 libva1 libfreetype6 libx265-dev libva-drm1 libva-x11-1\
    && pip install ffmpeg-normalize
