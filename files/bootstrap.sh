#!/bin/bash

REPORT_PORTAL_FOLDER=$HOME/reportportal


sudo yum -y install docker
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo chkconfig docker on

sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

mkdir -p $REPORT_PORTAL_FOLDER
cp $HOME/files/docker-compose.yml $REPORT_PORTAL_FOLDER

sudo sysctl -w vm.max_map_count=262144
mkdir -p $REPORT_PORTAL_FOLDER/data/elasticsearch
sudo chmod g+rwx $REPORT_PORTAL_FOLDER/data/elasticsearch
sudo chown 1000:1000 $REPORT_PORTAL_FOLDER/data/elasticsearch

# Sets some VM kernel parameters needed for the elaasticsearch container
(crontab -l 2>/dev/null; echo "@reboot sudo sysctl -w vm.max_map_count=262144") | crontab -
# Runs docker-compose on startup. Cheap workaround for running it the first time after installing docker and having to reboot
(crontab -l 2>/dev/null; echo "@reboot /bin/sleep 120 ; /usr/local/bin/docker-compose -f ~/reportportal/docker-compose.yml -p reportportal up -d --force-recreate") | crontab -

sudo reboot now