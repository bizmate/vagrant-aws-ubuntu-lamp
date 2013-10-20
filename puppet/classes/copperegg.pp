class copperegg {
notice("Running copperegg install")
  exec { 'install copperegg':
    command => 'curl -sk http://PLACEAPIKEYHERE@api.copperegg.com/rc.sh | sudo sh',
    path    => "/usr/local/bin/:/bin/:/usr/bin/",
 	require => Package['curl'],
  }
}
