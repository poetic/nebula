# Nebula

## Installation
`git clone https://github.com/poetic/nebula.git`

## Usage
`vagrant up`

### Adding Sites
To create a drupal 8 site, run this command inside the www folder:
`composer create-project drupal-composer/drupal-project:8.x-dev d8
--stability dev --no-interaction`.

Directories added inside the sites folder will become vhosts and aliased as
subdomains of .local. For example sites/d8 will become d8.local.
