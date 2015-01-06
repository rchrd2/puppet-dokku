dokku

This is a dokku module.

Example Usage
-------------

```
node web {
  # install dokku
  class {'dokku':
    version => 'v0.3.12',
    require => [Class['nginx']],
  }

  # install dokku plugins
  dokku::plugin { "dokku-rebuild":
    source => "https://github.com/scottatron/dokku-rebuild.git",
    version => "master",
  }
  dokku::plugin { "dokku-pg-plugin":
    source => "https://github.com/rchrd2/dokku-pg-plugin.git",
    version => "master",
  }
}
```


Example with Puppet Nginx
-------------------------
```
node web {
  class { 'nginx': }
  
  # install dokku
  class {'dokku':
    version => 'v0.3.12',
    require => [Class['nginx']],
  }

  # The catch-all hostname
  nginx::resource::vhost { '_' :
    # Name the default app "www"
    proxy => 'http://www',
  }
}
```



License
-------

MIT

Contact
-------

Richard Caceres - @rchrd2


Support
-------

Please log tickets and issues at our [Github repository](https://github.com/rchrd2/puppet-dokku)
