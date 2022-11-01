#!/usr/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null && pwd )"
docker create \
            --gpus 0 \
            --mount type=bind,source="$DIR"/elevator_button_recognition,target=/home/root/elevator_ws/src/levator_button_recognition \
            --name elevator_container \
            --hostname elev \
            --expose 1000-8000 \
            --ip 172.30.100.104 \
            -t \
            jongyoon/ros-tensorflow