# docker
# Raspberry Pi Setup

# Basic Setup

1. Add mac address on router and assign IP
2. Change passwd
3. Change Hostname
4. Expnad FileSystem
5. sudo apt-get Update
6. sudo apt-get Upgrade
7. Disable SWAP: 
	sudo dphys-swapfile swapoff
	sudo dphys-swapfile uninstall
	sudo update-rc.d dphys-swapfile remove
	sudo apt purge dphys-swapfile
	sudo free -m
8. sudo apt-get remove --purge wolfram-engine triggerhappy anacron logrotate xserver-common lightdm
9. sudo apt-get autoremove --purge
10. sudo apt-get clean
11. Assign static IP:  sudo nano /etc/dhcpcd.conf
12. Check Internet access
	a.  ip route
	b. Temp Fix: sudo ip route del 0/0 dev eth0
	c. Permanent Fix change rank of prefeed interface: sudo nano /etc/dhcpcd.conf
		interface eth0
		metric 400;
13. Add host to nodes:  

# Run As Root

# Docker Setup

1. curl -sSL get.docker.com | sh 
2. sudo usermod pi -aG docker
3. sudo systemctl enable docker

# Swarm Setup:

1. docker swarm init --advertise-addr <IPAddress> 	# note the output
2. docker node ls

	To Join nodes

	docker swarm join --token <token> <IPAddress>:2377

# Kubernetes Setup

1. sudo nano /boot/cmdline.txt: Add this text at the end of the line, but don't create any new lines:
	cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory
2. sudo nano /etc/apt/sources.list.d/kubernetes.list : add line
	deb http://apt.kubernetes.io/ kubernetes-xenial main
3. curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
4. sudo apt-get update
5. sudo apt-get install -qy kubeadm
6. sudo sysctl net.bridge.bridge-nf-call-iptables=1 

	Master Node Setup

	1. sudo kubeadm init --apiserver-advertise-address=<IPAddress>
	2. kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
	3. mkdir -p $HOME/.kube 
	4. sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config 
	5. sudo chown $(id -u):$(id -g) $HOME/.kube/config
	
	To Join nodes
	
	sudo kubeadm join --token <token> <IPAddress>:6443 --discovery-token-ca-cert-hash <Hash>
	
	Help: Find join command
	openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/^.* //' 

	DashBoard Setup

	kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/72832429656c74c4c568ad5b7163fa9716c3e0ec/src/deploy/recommended/kubernetes-dashboard-arm.yaml

# Build Image:

1. docker build . -t skumarvlab/dotnetcore:0.1-hello-console-arm -f Dockerfile.HelloConsole.arm
2. docker push skumarvlab/dotnetcore:0.1-hello-console-arm

# Run Image:

1. docker run  --name hellowebarm -ti -p 80:80 skumarvlab/dotnetcore:0.1-hello-web-arm
2. docker service  create --name hellowebarm --publish 80:80 skumarvlab/dotnetcore:0.1-hello-web-arm
3. docker service scale hellowebarm=5
4. docker service ps hellowebarm
