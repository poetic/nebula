# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/trusty64'

  config.vm.hostname = 'nebula'

  config.vm.provision 'ansible' do |ansible|
    ansible.playbook = './nebula/provisioning/playbook.yml'
    ansible.galaxy_role_file = './nebula/provisioning/requirements.yml'
  end

  config.vm.network 'private_network', ip: '192.168.33.10'
  config.vm.synced_folder 'sites', '/var/www', type: 'nfs', create: true

   config.vm.provider 'virtualbox' do |vb|
     vb.memory = 2048
     vb.cpus = 2
   end
end
