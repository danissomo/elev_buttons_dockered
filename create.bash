#!/bin/bash
docker build -t ros_cuda/tensorflow:test .
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null && pwd )"
docker create \
            --gpus 0 \
            --mount type=bind,source="$DIR"/elevator_button_recognition,target=/root/elevator_ws/src/levator_button_recognition \
            --name elevator_container \
            --hostname elev \
            --net host \
            -t \
            ros_cuda/tensorflow:test