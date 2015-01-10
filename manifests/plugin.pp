# Dokku plugin definition
#
# dokku::plugin { 'dokku-rebuild':
#   source => 'https://github.com/scottatron/dokku-rebuild.git',
#   version => 'master',
# }
#
# Copyright 2015 Richard Caceres

define dokku::plugin(
    $source, 
    $version='master',
    $ensure=present
) 
{
  vcsrepo { "/var/lib/dokku/plugins/${name}":
      ensure => $ensure,
      provider => git,
      revision => $version,
      source => $source,
      require => [Class['dokku::install']],
  }
  exec { "plugin-install-${name}":
      command => '/usr/local/bin/dokku plugins-install',
      require => [Vcsrepo["/var/lib/dokku/plugins/${name}"]]
  }
}