#!/bin/sh

set -o errexit
set -o verbose

source /opt/ros/kinetic/setup.bash
cd /var/tmp/
mkdir catkin_ws
cd catkin_ws
git clone https://github.com/Rob-Orb/ros-packages src
cd src
catkin_init_workspace
cd ../
catkin_make
