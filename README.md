# Nebula
Nebula uses Ansible (configuration management system) to provision a virtual machine that contains everything needed to run Drupal ( PHP, MySQL, Apache, etc… ). Beyond that, the virtual machine sends out mDNS (automatic domain name resolution) and is configured to have a shared folder between the host and virtual machine. You just drop your drupal site into a magic folder, apache will spin up a site, spin up a resolvable ‘sitename.local’ domain name, and you’re off to the races.

## Requirements

* Vagrant 1.8.1 +
https://www.vagrantup.com/downloads.html

* Virtualbox 5 +
https://www.virtualbox.org/wiki/Downloads

* Ansible 2.0.1.0 +
http://docs.ansible.com/ansible/intro_installation.html

* Drupal Console 0.10.5 +
https://drupalconsole.com

## Installation
`git clone https://github.com/poetic/nebula.git`

## Usage
* `vagrant up` inside the created `/nebula` folder
* `vagrant status` to check the state of the server (must run inside `/nebula`)
* `vagrant halt` to pause the server (must run inside `/nebula`)
* `vagrant destroy` erases your entire server (must run inside `/nebula`)
* site directories should be added to `/sites` (example: `/nebula/sites/sitedirectory`) and will be automatically aliased and accessible in your browser at `sitedirectory.local/`

##Creating a Site With Composer
Install dependencies at https://github.com/poetic/drupal-project and clone inside your `/nebula/sites/` folder

