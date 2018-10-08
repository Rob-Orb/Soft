FROM roborb/soft

RUN [ "cross-build-start" ]

RUN wget -qO - https://rob-orb.github.io/debian/pub.key | apt-key add -
RUN echo "deb http://rob-orb.github.io/debian stretch main" > /etc/apt/sources.list.d/rob-orb.list
RUN echo "deb http://packages.ros.org/ros/ubuntu stretch main" > /etc/apt/sources.list.d/ros-latest.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
RUN apt update
RUN apt install ros-kinetic-bare
RUN /opt/ros/kinetic/initialize.sh
RUN source /opt/ros/kinetic/setup.bash
RUN echo "yaml https://rob-orb.github.io/rosdistro/rosdep/ros-rosdistro-kinetic.yaml kinetic" > /etc/ros/rosdep/sources.list.d/90-ros-rosdistro-kinectic.list
RUN export ROSDISTRO_INDEX_URL=https://rob-orb.github.io/rosdistro/index.yaml
RUN rosdep update

RUN [ "cross-build-end" ]

