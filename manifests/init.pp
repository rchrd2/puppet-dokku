# == Class: dokku
#
# Installs and updates Dokku
#
# To install the latest verion of Dokku, just install the module
# and include dokku in your site.pp file
#
# === Parameters
#
# === Variables
#
# === Examples
#
# class {'dokku': 
#   version => 'v0.2.2'
# }
#
# === Authors
#
# Richard Caceres <me@rchrd.net>
#
# Originally derived from code by Quinn Rohlf. 
# See https://github.com/qrohlf/lair
#
# === Copyright
#
# Copyright 2015 Richard Caceres

class dokku ($version = 'v0.2.2') {
    class { 'dokku::install': } 
}
