#! /bin/sh
set -e

curl -fsSL 'https://download.docker.com/linux/ubuntu/gpg' | sudo apt-key add - && sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt update
sudo apt -y install docker-ce

sudo systemctl enable --now docker

sudo groupadd docker
sudo usermod -aG docker vagrant
