from nvidia/cuda:8.0-cudnn7-devel

COPY opencv.sh /
COPY libcudnn6_6.0.21-1+cuda8.0_amd64.deb /
RUN chmod +x /opencv.sh
ENV PATH=/opt/anaconda2/bin/:$PATH
RUN apt-get update \
    && apt-get install -y wget bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 git unzip cmake \
    && apt-get install -y build-essential cmake gcc g++ git libfdk-aac-dev libx264-dev libjasper-dev libeigen3-dev libtbb-dev yasm \
    && apt-get install -y libfreetype6-dev software-properties-common \
    && apt-get install -y ffmpeg libavcodec-dev libavformat-dev libswscale-dev libavutil-dev  vim mediainfo \
    && wget --quiet https://repo.continuum.io/archive/Anaconda2-5.0.1-Linux-x86_64.sh -O ~/anaconda.sh \
    && /bin/bash ~/anaconda.sh -b -p /opt/anaconda2 \
    && rm ~/anaconda.sh \
# Open CV build and installation
    && /opencv.sh \
	&& pip install librosa jsonpickle awscli boto3 \
    && dpkg -i libcudnn6_6.0.21-1+cuda8.0_amd64.deb \
# Install tensorflow
     && /opt/anaconda2/bin/pip install --ignore-installed --upgrade    https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-1.3.0-cp27-none-linux_x86_64.whl \
# Add pytorch
     && conda install -y -c pytorch \
         cuda80=1.0 \
         magma-cuda80=2.3.0 \
         pytorch=0.4.0 \
         torchvision=0.2.1\
     && conda clean -ya

