# Class:  apache2
#================================
#

class apache2 (
  $ensure         = hiera('apache2::ensure', 'installed'),
) {
    package { 'apache2':
      ensure => $ensure,
    }
    
}