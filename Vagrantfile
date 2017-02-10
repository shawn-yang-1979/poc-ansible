# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.define "control-machine" do |control|
    control.vm.box = "ubuntu/trusty64"
	control.vm.network "private_network", ip: "192.168.100.101"
	control.vm.provision "ssh-keygen", 
	  type: "shell", 
	  preserve_order: true,
	  path: "shell/ssh-keygen.sh"
	control.vm.provision "install-ansible",
	  type: "shell", 
	  preserve_order: true,
	  path: "shell/install-ansible.sh"	  
  end
  config.vm.define "backend" do |backend|
    backend.vm.box = "ubuntu/trusty64"
	backend.vm.network "private_network", ip: "192.168.100.201"
	backend.vm.provision "append-authorized-keys",
      type: "shell", 
      preserve_order: true,
      path: "shell/append-authorized-keys.sh"
  end
  (1..2).each do |i|
    config.vm.define "aggregator-#{i}" do |aggregator|
	  # Use debian, which is simular to Rasbian
      aggregator.vm.box = "bento/debian-8.2"
	  aggregator.vm.network "private_network", ip: "192.168.200.#{100+i}"
	  aggregator.vm.provision "append-authorized-keys",
	    type: "shell", 
		preserve_order: true,
	    path: "shell/append-authorized-keys.sh"
    end
  end
end