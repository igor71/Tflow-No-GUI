#!/usr/bin/env bash
EXTRA_FLAGS="--no-cache"

TFLOW_NO_GUI_VER=latest

docker build $EXTRA_FLAGS -f Dockerfile-tf-3.6 -t yi/tflow-no-gui:${TFLOW_NO_GUI_VER} .
