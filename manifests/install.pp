class dokku::install {
    #package { 'software-properties-common': ensure => present }
    #package { 'python-software-properties': ensure => present }
    package { 'wget': ensure => present }
    package { 'build-essential': ensure => present }
    package { 'git': ensure => present }
    
    vcsrepo { '/usr/src/dokku':
        ensure => present,
        provider => git,
        revision => $version,
        source => 'https://github.com/progrium/dokku.git',
        require => [Package['git']]
    }

    exec { 'dokku-install':
        cwd => '/usr/src/dokku',
        command =>  '/usr/bin/make install',
        timeout => '900', #it might take up to 15 minutes to install the whole shebang
        logoutput => 'true',
        # refreshonly => "true", this is not really that useful
        require => [
            Vcsrepo['/usr/src/dokku'], 
            Package['wget'], 
            Package['build-essential'], 
            #Package['software-properties-common'], 
            #Package['python-software-properties']
        ],
        subscribe => [Vcsrepo['/usr/src/dokku']],
    }
    
    exec { 'dokku-reload-nginx':
        command => '/usr/sbin/service nginx reload',
        require => [Exec['dokku-install']],
        subscribe => [Exec['dokku-install']],
        onlyif => "/usr/bin/which nginx",
    } 
}