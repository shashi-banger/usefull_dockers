FROM ubuntu:18.04
RUN apt-get update \
    && apt-get install -y --no-install-recommends wget ca-certificates dpkg-dev doxygen dos2unix graphviz curl pcscd libpcsclite-dev libcppunit-dev libcurl4 libcurl4-openssl-dev

RUN wget https://github.com/tsduck/tsduck/releases/download/v3.16-1110/tsduck_3.16-1110_amd64.deb \
    && dpkg -i tsduck_3.16-1110_amd64.deb \
    && wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh \
    && /bin/bash ~/miniconda.sh -b -p /opt/conda \
    && rm ~/miniconda.sh \
    && ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh

COPY ["rtpdump", "/usr/local/bin/"]

ENV PATH /opt/conda/bin:$PATH




