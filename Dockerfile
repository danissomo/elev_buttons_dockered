FROM jongyoon/ros-tensorflow
RUN pip3 install opencv-python pyyaml
ENV PROJECT_DIR=/home/root/elevator_ws
WORKDIR /home/root/elevator_ws
RUN source /opt/ros/kinetic/setup.bash
RUN mkdir src
RUN catkin_make
COPY .bashrc /home/root/
