#!/bin/sh

set -o errexit
set -o verbose

echo "deb http://packages.ros.org/ros/ubuntu stretch main" > /etc/apt/sources.list.d/ros-latest.list && 
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
apt update
rosdep init 
rosdep update
cd /var/tmp/
git clone https://github.com/Rob-Orb/Ros.git
mkdir Ros/catkin_ws 
cd Ros/catkin_ws 
rosinstall_generator ros_comm --rosdistro kinetic --deps --wet-only --exclude roslisp --tar > kinetic-ros_comm-wet.rosinstall 
wstool init src kinetic-ros_comm-wet.rosinstall 
rosdep install --from-paths src --ignore-src --rosdistro kinetic -y -r --os=debian:stretch 
cd src/catkin/cmake/test 
sed -i "s/set_target_properties(${target} PROPERTIES EXCLUDE_FROM_ALL TRUE)/#set_target_properties(${target} PROPERTIES EXCLUDE_FROM_ALL TRUE)/g" gtest.cmake
sed -i "s/set_target_properties(gtest gtest_main PROPERTIES EXCLUDE_FROM_ALL 1)/#set_target_properties(gtest gtest_main PROPERTIES EXCLUDE_FROM_ALL 1)/g" gtest.cmake
cd -
./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release --install-space ../opt/ros/kinetic
cd ../
debuild -us -uc
