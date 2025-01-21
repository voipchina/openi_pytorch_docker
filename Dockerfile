FROM pytorch/pytorch:2.4.0-cuda11.8-cudnn9-runtime
ENV DEBIAN_FRONTEND noninteractive
WORKDIR /workspace
RUN apt-get update -y && DEBIAN_FRONTEND=noninteractive apt-get install -y \
nvidia-driver-535 \
ffmpeg \
libsm6 \
libxext6 \
software-properties-common \
vim \
build-essential \
unzip \
tree \
git \
zip \
&& \
apt-get clean && \
rm -rf /var/lib/apt/lists/*
# RUN apt-get update -y
# RUN add-apt-repository ppa:deadsnakes/ppa -y
# RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python3.8
# RUN python --version
COPY requirements.txt .
# RUN pip install --progress-bar off --upgrade pip -i https://mirrors.aliyun.com/pypi/simple/
# RUN pip install --progress-bar off --no-cache-dir -r requirements.txt  -i https://mirrors.aliyun.com/pypi/simple/
RUN pip install --progress-bar off --upgrade pip
RUN pip install --progress-bar off --no-cache-dir -r requirements.txt
RUN apt install -y 
