FROM nvidia/cuda:10.0-cudnn7-runtime-ubuntu18.04

RUN apt-get update \
    && apt-get install -y \
    git \
    locales \
    default-jre \
    wget \
    python3 \
    python3-pip \
    && pip3 install --upgrade pip

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && locale-gen
ENV LC_ALL en_US.UTF-8 
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en

RUN git clone https://github.com/lvapeab/nmt-keras /opt/nmt-keras
WORKDIR /opt/nmt-keras
RUN pip install -e . \
    && pip install tensorflow-gpu==1.15
