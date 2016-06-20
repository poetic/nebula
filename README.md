# Nebula

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
`vagrant up` inside the created `/nebula` folder
add site directories inside of `/sites` (e.g. `/nebula/sites/sitedirectory/`) they will be automatically aliased and accessible in your browser at `sitedirectory.local/` 

##Creating a Site With Composer
Install dependencies at https://github.com/poetic/drupal-project and clone inside your `/nebula/sites/` folder

