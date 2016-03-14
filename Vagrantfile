# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.galaxy_role_file = "requirements.yml"
  end

  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder "www", "/var/www", type: 'nfs', create: true
  config.vm.synced_folder "aliases", "/etc/avahi/aliases.d", type: 'nfs', create: true

   config.vm.provider "virtualbox" do |vb|
     vb.memory = "1024"
     vb.cpus = 2
   end
end
