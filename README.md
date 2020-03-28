# Network Setup:

1. Add host to nodes: sudo nano /etc/hosts

192.168.1.221 pi21 pi21.local pi21.lan
192.168.1.222 pi22 pi22.local pi22.lan
192.168.1.223 pi23 pi23.local pi23.lan
192.168.1.224 pi24 pi24.local pi24.lan
192.168.1.225 pi25 pi25.local pi25.lan

192.168.1.231 pi31 pi31.local pi31.lan
192.168.1.232 pi32 pi32.local pi32.lan
192.168.1.233 pi33 pi33.local pi33.lan
192.168.1.234 pi34 pi34.local pi34.lan


# Docker Setup

1. curl -sSL get.docker.com | sh 
2. sudo usermod pi -aG docker
3. sudo systemctl enable docker

# Swarm Setup:

1. docker swarm init --advertise-addr <IPAddress> 	# note the output
2. docker node ls

	To Join nodes

	docker swarm join --token <token> <IPAddress>:2377



# Build Image:

1. git clone https://github.com/skumarvlab/docker.git
2. docker login docker.io
3. set DOCKER_HUB=skumarvlab
4. alpine.arm32v7:latest
    docker build . -t %DOCKER_HUB%/alpine.arm32v7:latest -f  ./alpine/arm32v7/latest
    docker push %DOCKER_HUB%/alpine.arm32v7:latest
5. alpine.arm32v7:python2
    docker build . -t %DOCKER_HUB%/alpine.arm32v7:python2 -f  ./alpine/arm32v7/python2
    docker push %DOCKER_HUB%/alpine.arm32v7:python2
6. alpine.arm32v7:python3
    docker build . -t %DOCKER_HUB%/alpine.arm32v7:python3 -f  ./alpine/arm32v7/python3
    docker push %DOCKER_HUB%/alpine.arm32v7:python3


