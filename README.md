# Tflow-No-GUI
This repository contains build no GUI tensorflow docker image

### Pre Requerements & Manual Buils steps:

```
Make sure nvidia/cuda:X.0-cudnnX-base (Image_ID: 51e73d3af9a7) image existing on the target server

Jenkins suppose to load docker image during buils proccess, if not:

pv /media/common/DOCKER_IMAGES/Nvidia/BasicImages/nvidia-cuda-9.0-cudnn7-base-1.5-1.9.tar | docker load

docker images

docker tag 51e73d3af9a7 nvidia/cuda:9.0-cudnn7-base

git clone --branch=master --depth=1 https://github.com/igor71/Tflow-No-GUI/

cd Tflow-No-GUI

bash tflow-no-gui-build-all.sh

### Comment following lines if you'll build docker images using Jenkins job

ARG FILE_NAME=tensorflow-1.8.0-cp36-cp36m-linux_x86_64.whl
ARG FTP_PATH=ftp://jenkins-cloud/pub/Tensorflow-1.8.0-9.0....

```
