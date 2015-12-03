# Class:  apache2
#================================
#

class apache2 (
  $ensure         =     hiera('apache2::ensure', $apache2::params::version),
  $configfile     =     hiera ('apache2::configfile',  $apache2::params::configfile),
  $port_number    =     hiera ('apache2::port_number', $apache2::params::port_number)
) inherits apache2::params {
    package { 'httpd':
      ensure => $ensure,
    } ->
    
    file { $configfile:
      mode      =>    '0755',
      content   =>    template('apache2/httpd.erb'),
      notify    =>    Service['httpd']
    
    }
    
    service {'httpd':
      ensure    =>    'running',
    }
    
    include  apache2::vhost
    
}