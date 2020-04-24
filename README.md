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
3. alpine.arm32v7:latest-builder
    docker build . -t skumarvlab/alpine.arm32v7:latest-builder -f  ./alpine/latest-builder.arm32v7.dockerfile
    docker run -it --name latest-builder skumarvlab/alpine.arm32v7:latest-builder
2. alpine:latest-prod
    docker build . -t skumarvlab/alpine.arm32v7:latest-prod -f  ./alpine/latest-prod.arm32v7.dockerfile
    docker run -it --name latest-prod skumarvlab/alpine.arm32v7:latest-prod
3. alpine:python-builder
    docker build . -t skumarvlab/alpine.arm32v7:python-builder -f  ./alpine/python-builder.arm32v7.dockerfile
    docker run -it --name python-builder skumarvlab/alpine.arm32v7:python-builder
4. alpine:python-prod
    docker build . -t skumarvlab/alpine.arm32v7:python-prod -f  ./alpine/python-prod.arm32v7.dockerfile
    docker run -it --name python-prod skumarvlab/alpine.arm32v7:python-prod
5. alpine:nginx-prod
    docker build . -t skumarvlab/alpine.arm32v7:nginx-prod -f  ./alpine/nginx-prod.arm32v7.dockerfile
    docker run -d --name nginx-prod -p 5000:80 -p 6000:443 skumarvlab/alpine.arm32v7:nginx-prod
6. alpine:redis-prod
    docker build . -t skumarvlab/alpine.arm32v7:redis-prod -f  ./alpine/redis-prod.arm32v7.dockerfile
    docker run -d --name redis-prod -p 5001:6379 skumarvlab/alpine.arm32v7:redis-prod

# Local Docker
1. alpine:latest-builder
    docker build . -t skumarvlab/alpine:latest-builder -f  ./alpine/latest-builder.pc.dockerfile
    docker run -it --name latest-builder skumarvlab/alpine:latest-builder
2. alpine:latest-prod
    docker build . -t skumarvlab/alpine:latest-prod -f  ./alpine/latest-prod.pc.dockerfile
    docker run -it --name latest-prod skumarvlab/alpine:latest-prod
3. alpine:python-builder
    docker build . -t skumarvlab/alpine:python-builder -f  ./alpine/python-builder.pc.dockerfile
    docker run -it --name python-builder skumarvlab/alpine:python-builder
4. alpine:python-prod
    docker build . -t skumarvlab/alpine:python-prod -f  ./alpine/python-prod.pc.dockerfile
    docker run -it --name python-prod skumarvlab/alpine:python-prod
5. alpine:nginx-prod
    docker build . -t skumarvlab/alpine:nginx-prod -f  ./alpine/nginx-prod.pc.dockerfile
    docker run -d --name nginx-prod -p 5000:80 -p 6000:443 skumarvlab/alpine:nginx-prod
6. alpine:redis-prod
    docker build . -t skumarvlab/alpine:redis-prod -f  ./alpine/redis-prod.pc.dockerfile
    docker run -d --name redis-prod -p 5001:6379 skumarvlab/alpine:redis-prod


