# -*- mode: ruby -*-
# vi: set ft=ruby :

NEBULA_ROOT = './.nebula'
ANSIBLE_ROOT = "#{NEBULA_ROOT}/ansible"
CONSOLE_ROOT = "#{NEBULA_ROOT}/console"

require "#{CONSOLE_ROOT}/plugin"

Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/trusty64'

  config.vm.hostname = 'nebula'

  config.vm.provision 'ansible' do |ansible|
    ansible.playbook = "#{ANSIBLE_ROOT}/playbook.yml"
    ansible.galaxy_role_file = "#{ANSIBLE_ROOT}/requirements.yml"
  end

  config.vm.network 'private_network', ip: '192.168.10.10'
  config.vm.synced_folder 'sites', '/var/www', type: 'nfs', create: true
  config.vm.synced_folder "#{CONSOLE_ROOT}/aliases", '/var/nebula/console', type: 'nfs', create: true

   config.vm.provider 'virtualbox' do |vb|
     vb.memory = 2048
     vb.cpus = 2
   end
end
