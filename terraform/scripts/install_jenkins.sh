#!/bin/bash

# Update package lists
sudo apt update

# Install Java
sudo apt install -y fontconfig openjdk-17-jre
java -version

# Add Jenkins repository key and source list
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package lists and install Jenkins
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y jenkins

sudo hostnamectl set-hostname jenkins

/bin/bash