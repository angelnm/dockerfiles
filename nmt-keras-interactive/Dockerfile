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

WORKDIR /opt/
RUN pip3 install \
    cloudpickle \
    future \
    https://github.com/MarcBS/keras/archive/master.zip \
    keras_applications \
    keras_preprocessing \
    h5py==2.10 \
    matplotlib \
    numpy \
    scikit-image \
    numpy \
    scikit-image \
    scikit-learn \
    six \
    tables \
    numpy \
    pandas \
    sacrebleu \
    sacremoses \
    scipy \
    tensorflow==1.15 \
    tensorflow-gpu==1.15 \
    && git clone https://github.com/lvapeab/coco-caption.git    

RUN git clone https://github.com/angelnm/nmt-keras-click.git \
    && git clone https://github.com/angelnm/keras-click.git
ENV PYTHONPATH="/opt/coco-caption:/opt/keras-click:$PYTHONPATH"
