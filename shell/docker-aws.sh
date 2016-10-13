#! /bin/bash

#Install docker

sudo apt-get update
sudo apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
sudo apt-get install -y apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo cp -f /home/ubuntu/config/shell/src/docker.list /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get purge lxc-docker
apt-cache policy docker-engine
sudo apt-get install -y docker-engine
curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
sudo service docker start

#Sort out groups

# sudo groupadd docker
# sudo usermod -aG docker vagrant

# #install things
# sudo apt-get install -y python-pip
#
# #install chefdk
# wget -q https://packages.chef.io/stable/ubuntu/12.04/chefdk_0.18.30-1_amd64.deb > /dev/null
# sudo dpkg -i chefdk_0.18.30-1_amd64.deb
#
# #cookbook stuff
# mkdir -p /home/vagrant/cd-nginx/chef/site-cookbooks
# sudo cp -f /home/vagrant/shell/src/Berksfile /home/vagrant/cd-nginx/Berksfile
#
# pushd /home/vagrant/cd-nginx
# berks install
# berks vendor chef/cookbooks
# popd
#
# sudo cp -f /home/vagrant/shell/src/zero.rb /home/vagrant/cd-nginx/chef/zero.rb
# sudo cp -f /home/vagrant/shell/src/first-boot.json /home/vagrant/cd-nginx/chef/first-boot.json
# sudo cp -f /home/vagrant/shell/src/Dockerfile /home/vagrant/cd-nginx/chef/Dockerfile
#
# sudo cp -f /home/vagrant/shell/src/Dockerfile-nginx /home/vagrant/cd-nginx/Dockerfile
# sudo cp -f /home/vagrant/shell/src/startup.sh /home/vagrant/cd-nginx/startup.sh
# sudo cp -f /home/vagrant/shell/src/docker-compose.yml /home/vagrant/cd-nginx/docker-compose.yml
#
# sudo chmod -R 777 cd-nginx
