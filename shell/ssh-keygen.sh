#!/bin/bash
cd /home/vagrant
rm -f .ssh/id_rsa*
sudo -u vagrant -H bash -c "ssh-keygen -t rsa -f .ssh/id_rsa -N ''"
mkdir -p /vagrant/key
rm -f /vagrant/key/control-machine-rsa.pub
cp .ssh/id_rsa.pub /vagrant/key/control-machine-rsa.pub