class mysql {
  package { 'mysql-server':
    ensure  => present,
    require => Exec['apt-update'],
  }

  package { 'php5-mysql':
    ensure  => present,
    require => Package['php5'],
    notify  => Service['apache2'],
  }

  service { 'mysql':
    ensure  => running,
    require => Package['mysql-server'],
  }

  file { 'mysql configuration':
    path    => '/etc/mysql/conf.d/conf.cnf',
    ensure  => present,
    content => "\
[mysqld]
lower_case_table_names = 1
bind-address = 0.0.0.0
skip-external-locking = FALSE
",
    require => Package['mysql-server'],
    notify  => Service['mysql'],
    mode    => 644,
  }
  
  exec { 'create bizmate db':
    unless  => '/usr/bin/mysql -uroot bizmate',
    command => '/usr/bin/mysql -uroot -e "create database bizmate;"',
    require => Service['mysql'],
  }
  
  exec { 'create bizmate user': 
    unless  => '/usr/bin/mysql -ubizmate -pputenz bizmate',
    command => '/usr/bin/mysql -uroot -e "\
      create user \'bizmate\'@\'localhost\' identified by \'putenz\';\
      create user \'bizmate\'@\'%\' identified by \'putenz\';\
      grant all privileges on bizmate.* to \'bizmate\'@\'localhost\' identified by \'putenz\';\
      grant all privileges on bizmate.* to \'bizmate\'@\'%\' identified by \'putenz\';\
      flush privileges;"',
    require => Exec['create bizmate db']
  }
}
