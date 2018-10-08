#/bin/bash
docker exec -i roborb-ros bash < $1
sudo chown -R $(id -u):$(id -g) docker-output
