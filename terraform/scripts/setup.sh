#!/usr/bin/env bash
# General system prerequisites
sudo apt install wget unzip -y
# Initial system update
sudo apt update -y
# Install Docker software
# Install docker prerequisites
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
# Install key for docker repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# Install docker repo
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
# Update to ensure all latest files
sudo apt update -y
# Install docker
sudo apt install docker-ce -y
# Add system user to docker group
sudo usermod -aG docker ubuntu

# # Install Jenkins CI Pipeline
# # install jenkins prerequisites
# sudo apt install openjdk-8-jdk -y
# # Add key for jenkins repo
# wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
# # Add Jenkins repo
# sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
# # Update again
# sudo apt update -y
# # install jenkins
# sudo apt install jenkins
# sudo systemctl start jenkins
# # Add jenkins user to docker group
# sudo usermod -aG docker jenkins

# # Install AWS CLI v2
# # Dowloand cli.zip file from aws
# curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
# # Unzip cli
# unzip awscliv2.zip
# # Install AWS CLI
# sudo ./aws/install

# # Install Kubernetes kubectl
# # Download latest kubectl version
# curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
# # Make the kubectl binary executable
# chmod +x ./kubectl
# # move binary to correct location
# sudo mv ./kubectl /usr/local/bin/kubectl

sudo reboot