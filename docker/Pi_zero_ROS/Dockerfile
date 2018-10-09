FROM roborb/soft

RUN [ "cross-build-start" ]

RUN wget -qO - https://rob-orb.github.io/debian/pub.key | apt-key add -
RUN echo "deb http://rob-orb.github.io/debian stretch main" > /etc/apt/sources.list.d/rob-orb.list
RUN apt update
RUN apt install ros-kinetic-bare
RUN /opt/ros/kinetic/initialize.sh
RUN source /opt/ros/kinetic/setup.bash
RUN echo "yaml https://rob-orb.github.io/rosdistro/rosdep/ros-rosdistro-kinetic.yaml kinetic" > /etc/ros/rosdep/sources.list.d/90-ros-rosdistro-kinectic.list
RUN export ROSDISTRO_INDEX_URL=https://rob-orb.github.io/rosdistro/index.yaml
RUN rosdep update

RUN [ "cross-build-end" ]

