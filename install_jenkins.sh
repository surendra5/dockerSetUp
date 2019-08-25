#!/bin/bash

# this script is only tested on ubuntu xenial

# install docker
sudo apt-get update
sudo apt-get install -y docker-engine
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker ubuntu

# run jenkins
sudo mkdir -p /var/jenkins_home
sudo chown -R 1000:1000 /var/jenkins_home/
sudo docker run -p 8080:8080 -p 50000:50000 -v /var/jenkins_home:/var/jenkins_home -d --name jenkins jenkins/jenkins:lts

# show endpoint
echo 'Jenkins installed'
echo 'You should now be able to access jenkins at: http://'$(curl -s ifconfig.co)':8080'
