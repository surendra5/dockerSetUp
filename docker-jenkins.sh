#docker install script for ubuntu xenial 16.04

#install docker
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository  "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
docker run hello-world

#docker endpoint
echo 'Docker installed Successfully'

#run jenkins
sudo mkdir -p /var/jenkins_home
sudo chown -R 1000:1000 /var/jenkins_home/
sudo docker run -p 8080:8080 -p 50000:50000 -v /var/jenkins_home:/var/jenkins_home -d --name jenkins jenkins/jenkins:lts

#jenkins endpoint
echo 'jenkins install successfully, access from http://'$(curl -s ifconfig.co)':8080'
