class sitesetup{
	package { 'git':
      ensure => 'present',
      require => Exec['apt-update'],
      notify  => Service['apache2'],
      #path    => "/usr/local/bin/:/bin/:/usr/bin/",
    }
    
	#make sure pub key to pull code is copied
	file { 'git rsa pub':
    	path    => '/home/ubuntu/.ssh/id_rsa.pub',
    	ensure  => present,
    	source => "/vagrant/bizmate_git_rsa.pub",
    	mode    => 644,
  	}
  	#make sure private key to pull code is copied
  	file { 'git rsa private':
    	path    => '/home/ubuntu/.ssh/id_rsa',
    	ensure  => present,
    	source => "/vagrant/bizmate_git_rsa",
    	mode    => 640,
  	}
  	
  	
  	file { '/var/www/index.html':
    	ensure => absent,
  	}
  	
  	/*exec { 'checkout site repo':
  		cwd => '/var/www/',
    	unless  => 'git pull',
    	command => "git clone $global_git_repo_url .",
    	require => Package['git'],
    	notify  => Service['apache2'],
    	path    => "/usr/local/bin/:/bin/:/usr/bin/",
  	}*/
}