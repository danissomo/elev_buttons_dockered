# This is an auto generated Dockerfile for ros:ros-core
# generated from docker_images/create_ros_core_image.Dockerfile.em
FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu20.04

ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# install packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    dirmngr \
    gnupg2 \
    curl \
    && rm -rf /var/lib/apt/lists/*

# setup keys
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu focal main" > /etc/apt/sources.list.d/ros-latest.list'

RUN apt install curl && curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -

# install bootstrap tools
RUN apt update && apt install -y ros-noetic-ros-base

RUN apt install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# bootstrap rosdep
RUN rosdep init \
    && rosdep update

# install ros packages
ENV ROS_DISTRO noetic



CMD ["bash"]

RUN apt-get update && apt-get install -y \
                        python3 \
                        python3-pip \
                        nano \
                        python3-dev \
                        git \
                        cmake \
                        python3-h5py
RUN python3 -m pip install cython numpy pkgconfig scikit-build
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install tensorflow   opencv-python pyyaml 
RUN python3 -m pip install rospkg matplotlib opencv-python pyyaml
RUN cd ~/ &&\
    git clone https://github.com/Itseez/opencv.git &&\
    git clone https://github.com/Itseez/opencv_contrib.git &&\
    cd opencv && mkdir build && cd build && cmake  -DWITH_QT=ON -DWITH_OPENGL=ON -DFORCE_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON -DWITH_XINE=ON -DBUILD_EXAMPLES=ON .. && \
    make -j4 && make install && ldconfig

ENV PROJECT_DIR=/root/elevator_ws
WORKDIR /root/elevator_ws
COPY .bashrc /root/
RUN ls /opt/
RUN mkdir src

