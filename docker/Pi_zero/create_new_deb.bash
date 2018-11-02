#!/bin/bash
set -e
set -o pipefail
apt update
rosdep update
NAMEOFTHEPACKAGE=$1
rosinstall_generator $NAMEOFTHEPACKAGE --rosdistro kinetic --wet-only --tar > kinetic-$NAMEOFTHEPACKAGE-wet.rosinstall
wstool init -j1 src kinetic-$NAMEOFTHEPACKAGE-wet.rosinstall
rosdep install --from-paths src --ignore-src --rosdistro kinetic -y
PACKAGE_VERSION=$(cat kinetic-* | sed -n -e 's/.*release-kinetic-[a-zA-Z_]*-//p') 
cd src/$(cat kinetic-$NAMEOFTHEPACKAGE-wet.rosinstall | awk '/local/ {print $2}')
bloom-generate rosdebian --ros-distro kinetic
debmake -t -y 
debuild -us -uc 
PACKAGE_NAME_FULL=$(cat debian/control | awk '/Source/ {print $2}')
reprepro -b /var/tmp/ros/rob-orb.github.io/debian include stretch ../${PACKAGE_NAME_FULL}_${PACKAGE_VERSION}stretch_armhf.changes
cd /var/tmp/ros/rob-orb.github.io
vim rosdistro/rosdep/ros-rosdistro-kinetic.yaml
git add .
git commit -m "add ${NAMEOFTHEPACKAGE}"
cd /var/tmp/ros/ws/src
rm kinetic*
rm -Rf src/* src/.ros*
