dokku

This is a dokku module.

Example Usage
-------------

```
node web {
  # install dokku
  class {'dokku':
    version => 'v0.3.12',
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

Note. Integration with the Nginx module is a work in progress. It might take some troubleshooting as it is right now.

```
node web {
  class { 'nginx': }
  
  # install dokku
  class {'dokku':
    version => 'v0.3.12',
    require => [Class['nginx']],
  }

  nginx::resource::vhost { 'example.com' :
    proxy => 'http://www',
  }
}
```

Installation
------------

### puppet-librarian Puppetfile
```
forge "http://forge.puppetlabs.com"

mod 'jfryman/nginx', '0.0.9'

mod 'rchrd2/dokku',
  :git => "git://github.com/rchrd2/puppet-dokku.git"
```


### Puppetforge
```
puppet module install rchrd2-dokku
```



Todo
----

- [ ] Set hostname for dokku (/home/dokku/HOSTNAME)
- [ ] ? Feature requests welcome


License
-------

MIT

Contact
-------

Richard Caceres - @rchrd2


Support
-------

Please log tickets and issues at our [Github repository](https://github.com/rchrd2/puppet-dokku)


Related
-------

- [Dokku](https://github.com/progrium/dokku)
- [Lair](https://github.com/qrohlf/lair)
- [Chef-dokku](https://github.com/fgrehm/chef-dokku)