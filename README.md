# Nebula

## Installation
`git clone https://github.com/poetic/nebula.git`

## Usage
`vagrant up`

### Adding Sites
Directories added inside the www folder will become vhosts and aliased as
subdomains of .local. For example www/foo will become foo.local. Right now
manual work needs to be done to get your .local domain name to resolve. See
below.

### mDNS Resolution
Add a file inside the aliases folder. Inside that file, specify domain names
you'd like to automatically resolve (example: foo.local). Add one domain name
per line.

After this, you'll need to restart avahi-aliases. To do this, ssh into the box:
`vagrant ssh`. Then run `sudo restart avahi-aliases`.
