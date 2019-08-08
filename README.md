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

1. docker build . -t skumarvlab/dotnetcore:0.1-hello-console-arm -f Dockerfile.HelloConsole.arm
2. docker push skumarvlab/dotnetcore:0.1-hello-console-arm

# Run Image:

1. docker run  --name hellowebarm -ti -p 80:80 skumarvlab/dotnetcore:0.1-hello-web-arm
2. docker service  create --name hellowebarm --publish 80:80 skumarvlab/dotnetcore:0.1-hello-web-arm
3. docker service scale hellowebarm=5
4. docker service ps hellowebarm
