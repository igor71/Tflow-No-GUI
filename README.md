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
### This build based on nvidia/cuda:9.0-cudnn7-base-1.5-1.9 docker image
```
CUDA Version   -->> 9.0.176

CUDNN Version  -->> 7.0.5.15

PYTHON Version -->> 3.6.3
```

NOTES:

1.  Run the docker manually by executing following command:
   ```
   nvidia-docker run -id --name tflow-no-gui --user 1001:1001 -v /media:/media yi/tflow-no-gui:latest
   or
   nvidia-docker run -id --name tflow-no-gui -u jenkins -v /media:/media yi/tflow-no-gui:lates
   
   -i  : Keep STDIN open even if not attached
   -d  : Detached mode. Run container in the background
   -t  : Allocate a pseudo-tty
   ```
   Docker image prepared to run under local jenkins user (UID & GUID: 1001). This will tell Docker to run its processes with
   user ID 1001 and group ID 1001. That will mean that any files created by that process also belong to the user with ID 1001.

   However, this docker image setup properly to allow manual step execution inside docker container as jenkins user.
   This jenkins user pre-existing inside docker image and has the same UID & GUID as jenkins user on the host server. So
   any files created inside docker container manually will have the same owner (jenkins). This will prevent permissions
   problems when files saved outside of the docker container.
   For doing so, need to run docker image detached (like in above command) and then, access docker container as following:
   ```
   docker exec -it tflow-no-gui /bin/bash
   If you need become root, run the following:
   sudo su
   ```
