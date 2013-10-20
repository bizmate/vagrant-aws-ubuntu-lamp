import 'classes/*'

class amp {
  exec { 'apt-update':
    command => '/usr/bin/apt-get update',
  }

  include apache2
  include mysql
  include php5
  include copperegg
  include xdebug
  include curl
  include sitesetup
}

include amp