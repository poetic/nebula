# Nebula

##Environment Dependencies (install these first)
* VirtualBox https://www.virtualbox.org/wiki/Downloads
* Vagrant https://www.vagrantup.com/downloads.html

## Installation
`git clone https://github.com/poetic/nebula.git`

## Usage
run `vagrant up` inside the created /nebula folder

##Creating a Site

### Drupal Site Dependencies

* Drupal Console https://drupalconsole.com/
* Composer https://getcomposer.org/download/)

###Installing a Drupal Site
1. To create a drupal 8 site, clone this repository inside the /sites folder
(replace SITE_NAME with the name of your site):
2. `git clone https://github.com/poetic/drupal-project.git SITE_NAME`
3. `cd` into created directory and run `composer install`

Directories added inside the sites folder will become vhosts and aliased as
subdomains of .local. For example sites/d8 will become d8.local/

4.In your browser, go to SITE_NAME.local/ (e.g. `newsite.local/` whatever you
replaced SITE_NAME with when cloning in step 1) and follow the drupal
installation screen instructions

NOTE: You must use `root` as both the database username and password (e.g. username: `root` password: `root`) on the database creation screen of the drupal install walkthrough
