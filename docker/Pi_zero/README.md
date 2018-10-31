## Create a deb pkg from source
#SOURCES (ROS and ROB-ORB and rosdep ROB-ORB)
echo "deb http://packages.ros.org/ros/ubuntu stretch main" > /etc/apt/sources.list.d/ros-latest.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

wget -qO - https://rob-orb.github.io/debian/pub.key | apt-key add -
echo "deb http://rob-orb.github.io/debian stretch main" > /etc/apt/sources.list.d/rob-orb.list

apt update

rosdep init
rosdep update
echo "yaml https://rob-orb.github.io/rosdistro/rosdep/ros-rosdistro-kinetic.yaml" > /etc/ros/rosdep/sources.list.d/90-rob-orb.list
rosdep update

#REPREPRO KEY
gpg --import private.asc #import your private key

#DEPENDENCIES
apt install vim debmake reprepro #reprepro from the docker since only reprepro-5.0


#dh_make requirements
export DEBEMAIL= #mail
export DEBFULLNAME= #full name as in the private key (Ulysse Vautier (Rob-Orb))

(#######)
apt install python-catkin-pkg \
            python3-debian
NAMEOFTHEPACKAGE=''
rosinstall_generator $NAMEOFTHEPACKAGE --rosdistro kinetic --wet-only --tar > kinetic-$NAMEOFTHEPACKAGE-wet.rosinstall # the first NAMEOFTHEPACKAGE is with underscore not dashes
wstool init -j1 src kinetic-$NAMEOFTHEPACKAGE-wet.rosinstall
rosdep install --from-paths src --ignore-src --rosdistro kinetic -y 
PACKAGE_VERSION=$(cat kinetic-* | sed -n -e 's/.*release-kinetic-[a-zA-Z_]*-//p')
#cd to the package
cd src/$(cat kinetic-$NAMEOFTHEPACKAGE-wet.rosinstall | awk '/local/ {print $2}')
bloom-generate rosdebian --ros-distro kinetic
debmake -t -y
debuild -us -uc

#REPREPRO
PACKAGE_NAME_FULL=$(cat debian/control | awk '/Source/ {print $2}')
reprepro -b [rob-orb.github.io]/debian include stretch ../${PACKAGE_NAME_FULL}_${PACKAGE_VERSION}stretch_armhf.changes
vim [rob-orb.github.io]/rosdistro/rosdep/ros-rosdistro-kinetic.yaml #update the corresponding line
git add .
git commit -m "add ${NAMEOFTHEPACKAGE}"
git push

#INSTALL THE PACKAGE YOU JUST MADE AND UPDATE ROSDEP
rosdep update
apt install ros-kinetic-{PACKAGE}

#REPEAT TO (#######)
