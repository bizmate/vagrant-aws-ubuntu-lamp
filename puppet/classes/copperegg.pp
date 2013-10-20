class copperegg {
notice("Running copperegg install with API KEY $global_copperegg_api_key")
  exec { 'install copperegg':
    command => "curl -sk http://$global_copperegg_api_key@api.copperegg.com/rc.sh | sudo sh",
    path    => "/usr/local/bin/:/bin/:/usr/bin/",
 	require => Package['curl'],
  }
}
