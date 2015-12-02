# Class:  apache2
#================================
#

class apache2 (
  $ensure         = hiera('apache2::ensure', 'installed'),
) {
    package { 'httpd':
      ensure => $ensure,
    } ->
    
    service {'httpd':
      ensure => 'running',
    }
    
}