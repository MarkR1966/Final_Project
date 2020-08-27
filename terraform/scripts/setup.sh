#!/usr/bin/env bash
# initial system update
sudo apt update -y
# install docker prerequisites
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
# install key for docker repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# install docker repo
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
# update to ensure all latest files
sudo apt update -y
# install docker
sudo apt install docker-ce -y
# add system user to docker group
sudo usermod -aG docker ubuntu

# # install jenkins prerequisites
# sudo apt install openjdk-8-jdk -y
# # add key
# wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
# # add repo
# sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
# #update
# sudo apt update -y
# #install jenkins
# sudo apt install jenkins
# sudo systemctl start jenkins
# #add jenkins user to docker group
# sudo usermod -aG docker jenkins

sudo reboot