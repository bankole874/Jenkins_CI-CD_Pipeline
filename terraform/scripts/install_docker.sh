#!/bin/bash

sudo apt update -y

# Docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y
sudo apt install docker-ce docker-ce-cli containerd.io -y

# Add the docker group
# sudo groupadd docker

# Add the current user to the docker group
sudo usermod -aG docker $USER
# su - ${USER}

# Refresh group membership without requiring a password
newgrp docker

sudo hostnamectl set-hostname docker

/bin/bash