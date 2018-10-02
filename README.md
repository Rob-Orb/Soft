[![Docker Build](https://dockerbuildbadges.quelltext.eu/status.svg?organization=roborb&repository=soft)](https://hub.docker.com/r/roborb/soft/builds/)  

# Docker Hub
# You first need to install Docker and qemu-system-arm qemu-user-static
## Usage
```
git clone https://github.com/Rob-Orb/Soft.git
cd Soft/docker
docker pull roborb/soft
make start # to start the docker
./rob_orb_compute.sh wiringPi.sh # as an example
```
