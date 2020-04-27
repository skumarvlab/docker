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


1. git clone https://github.com/skumarvlab/docker.git
2. docker login docker.io

# PI Image:
1. alpine:latest-prod
    docker build . -t skumarvlab/alpine.arm32v7:latest-prod -f  ./alpine/latest-prod.arm32v7.dockerfile
    docker run -d --name latest-prod skumarvlab/alpine.arm32v7:latest-prod
2. alpine:python-prod
    docker build . -t skumarvlab/alpine.arm32v7:python-prod -f  ./alpine/python-prod.arm32v7.dockerfile
    docker run -d --name python-prod skumarvlab/alpine.arm32v7:python-prod
3. alpine:uwsgi-python-prod
    docker build . -t skumarvlab/alpine.arm32v7:uwsgi-python-prod -f  ./alpine/uwsgi-python-prod.pc.dockerfile
    docker run -d --name uwsgi-python-prod -p 5001:80 skumarvlab/alpine.arm32v7:uwsgi-python-prod
4. alpine:nginx-prod
    docker build . -t skumarvlab/alpine.arm32v7:nginx-prod -f  ./alpine/nginx-prod.arm32v7.dockerfile
    docker run -d --name nginx-prod -p 5002:80 -p 6000:443 skumarvlab/alpine.arm32v7:nginx-prod
5. alpine:redis-prod
    docker build . -t skumarvlab/alpine.arm32v7:redis-prod -f  ./alpine/redis-prod.arm32v7.dockerfile
    docker run -d --name redis-prod -p 5003:6379 skumarvlab/alpine.arm32v7:redis-prod

# PC Image:
1. alpine:latest-prod
    docker build . -t skumarvlab/alpine:latest-prod -f  ./alpine/latest-prod.pc.dockerfile
    docker run -it --name latest-prod skumarvlab/alpine:latest-prod
2. alpine:python-prod
    docker build . -t skumarvlab/alpine:python-prod -f  ./alpine/python-prod.pc.dockerfile
    docker run -it --name python-prod skumarvlab/alpine:python-prod
3. alpine:uwsgi-python-prod
    docker build . -t skumarvlab/alpine:uwsgi-python-prod -f  ./alpine/uwsgi-python-prod.pc.dockerfile
    docker run -it --name uwsgi-python-prod -p 5001:80 skumarvlab/alpine:uwsgi-python-prod
4. alpine:redis-prod
    docker build . -t skumarvlab/alpine:redis-prod -f  ./alpine/redis-prod.pc.dockerfile
    docker run -d --name redis-prod -p 5002:6379 skumarvlab/alpine:redis-prod
5. alpine:nginx-prod
    docker build . -t skumarvlab/alpine:nginx-prod -f  ./alpine/nginx-prod.pc.dockerfile
    docker run -d --name nginx-prod -p 5003:80 -p 6000:443 skumarvlab/alpine:nginx-prod


