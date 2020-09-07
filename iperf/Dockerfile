FROM ubuntu:18.04
  
RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get -y install build-essential git && \
  git clone https://github.com/esnet/iperf.git && \
  cd iperf && \
  ./configure && \
  make && make install && ldconfig


