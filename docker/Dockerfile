FROM resin/rpi-raspbian:stretch-20180815

RUN [ "cross-build-start" ]

RUN uname -a
RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y git \
                       make \
                       gcc \
                       g++
RUN [ "cross-build-end" ]
