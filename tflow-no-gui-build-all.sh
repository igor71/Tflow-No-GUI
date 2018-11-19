#!/usr/bin/env bash
EXTRA_FLAGS="--no-cache"

TFLOW_VER=latest
TFLOW_NO_GUI_VER=latest

docker build $EXTRA_FLAGS -f Dockerfile.Basic -t yi/tflow:${TFLOW_VER} . && \
docker build $EXTRA_FLAGS -f Dockerfile.tflow-gui -t yi/tflow-gui:${TFLOW_NO_GUI_VER} .
