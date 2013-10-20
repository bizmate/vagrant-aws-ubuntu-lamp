class sitesetup{
	#make sure pub key to pull code is copied
	file { 'git rsa pub':
    	path    => '/home/ubuntu/.ssh/id_rsa.pub',
    	ensure  => present,
    	source => "/vagrant/bizmate_git_rsa.pub",
    	#mode    => 644,
  	}
  	#make sure private key to pull code is copied
  	file { 'git rsa private':
    	path    => '/home/ubuntu/.ssh/id_rsa',
    	ensure  => present,
    	source => "/vagrant/bizmate_git_rsa",
    	#mode    => 644,
  	}
  	
  	#file { '/var/www/index.html':
    #	ensure => absent,
  	#}
}