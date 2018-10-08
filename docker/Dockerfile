FROM resin/rpi-raspbian:stretch-20180815

RUN [ "cross-build-start" ]

RUN uname -a
RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y git \
	    make \
	    gcc \
	    g++ \
	    build-essential \
	    devscripts \
	    fakeroot \
	    debhelper \
	    build-essential \
	    python-yaml \
	    cmake \
	    subversion \
	    wget \
	    python-setuptools \
	    mercurial \
	    git-core \
	    libapr1-dev \
	    libaprutil1-dev \
	    libbz2-dev \
	    python-dev \
	    libgtest-dev \
	    python-paramiko \
	    libboost-all-dev \
	    liblog4cxx10-dev \
	    pkg-config \
	    python-empy \
	    swig \
	    python-nose \
	    lsb-release \
	    python-pip \
	    python-gtk2 \
	    apt-transport-https
RUN pip install rosdep \
		rosinstall_generator \
		wstool \
		rosinstall \
		bloom
RUN [ "cross-build-end" ]

