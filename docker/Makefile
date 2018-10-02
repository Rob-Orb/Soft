all:
	docker image build --tag roborb/soft .
start:
	mkdir -p ${PWD}/docker-output
	docker stop roborb-soft || true
	docker run -t -d --rm --name roborb-soft -v ${PWD}/docker-output:/var/tmp/ roborb/soft
	echo "you can now run a script with the cmd rob_orb_compute my_fancy_script.sh"
