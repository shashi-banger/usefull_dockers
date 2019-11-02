FROM ubuntu:xenial

ENV LANG C.UTF-8

RUN apt-get update && apt-get install --no-install-recommends -y \
    && apt-get install -y software-properties-common wget apt-transport-https unzip \
    && wget https://github.com/obfuscurity/synthesize/archive/master.zip \
    && unzip master.zip \
    && cd synthesize-master/ \
    && ./install \
    && add-apt-repository "deb https://packages.grafana.com/oss/deb stable main" \
    && add-apt-repository "deb https://packages.grafana.com/oss/deb beta main" \
    && wget -q -O - https://packages.grafana.com/gpg.key | apt-key add - \
    && apt-get update \
    && apt-get install -y grafana
