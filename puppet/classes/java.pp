class java {
  package { 'default-jdk':
    ensure  => present,
    require => Exec['apt-update'],
  }
  
  exec { "add_java_home":
    command => "echo export JAVA_HOME=/usr/lib/jvm/default-java/bin/java >> /etc/profile; source /etc/profile",
    onlyif => 'test `echo $JAVA_HOME|grep -c java` -eq 0',
    path    => "/bin:/usr/bin",
  }
  
  #
  #package { 'augeas-tools':
  #  ensure  => present,
  #  require => Exec['apt-update'],
  #}
  
  #package { 'libaugeas0':
  #  ensure  => present,
  #  require => Exec['apt-update'],
  #}
}
