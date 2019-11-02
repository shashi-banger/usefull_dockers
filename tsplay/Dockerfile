FROM continuumio/miniconda3:4.5.12

RUN apt-get update \
    && apt-get install -y --no-install-recommends s3fs \
    && rm -rf /var/lib/apt/lists/*

COPY ["tsplay", "/usr/local/bin/"]
