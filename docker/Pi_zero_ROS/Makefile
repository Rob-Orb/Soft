all:
	docker image build --tag roborb/ros:pi_zero .
force:
	docker image build --no-cache --tag roborb/ros:pi_zero .
start:
	mkdir -p ${PWD}/docker-output
	docker stop roborb-ros || true
	docker run -t -d --rm --name roborb-ros -v ${PWD}/docker-output:/var/tmp/ roborb/ros:pi_zero
	echo "you can now run a script with the cmd rob_orb_compute my_fancy_script.sh"
