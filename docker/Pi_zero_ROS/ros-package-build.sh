#!/bin/sh

set -o errexit
set -o verbose

wget -qO - https://rob-orb.github.io/debian/pub.key | sudo apt-key add -
echo "deb http://rob-orb.github.io/debian stretch main" > /etc/apt/sources.list.d/rob-orb.list
echo "deb http://packages.ros.org/ros/ubuntu stretch main" > /etc/apt/sources.list.d/ros-latest.list && 
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
apt update
apt install ros-kinetic-bare
/opt/ros/kinetic/initialize.sh
source /opt/ros/kinetic/setup.bash
echo "yaml https://rob-orb.github.io/rosdistro/rosdep/ros-rosdistro-kinetic.yaml kinetic" > /etc/ros/rosdep/sources.list.d/90-ros-rosdistro-kinectic.list
export ROSDISTRO_INDEX_URL=https://rob-orb.github.io/rosdistro/index.yaml
rosdep update
cd /var/tmp/
mkdir catkin_ws
cd catkin_ws
git clone https://github.com/Rob-Orb/ros-packages src
cd src
catkin_init_workspace
cd ../
catkin_make
