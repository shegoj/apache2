#class vhost.pp
#----------------------------
# to set name or IP based vhosts
class apache2::vhost (
  $type         =     hiera('apache2::vhost:type', $apache2::params::vhost_type),
  $servername   =     hiera('apache2::vhost:servername', $apache2::params::vhost_servername)
) {
     if $servername == undef {
        $actualServername = $hostname
    }
    else {
      $actualServername = $servername
    }
  
    file { '/etc/httpd/conf/httpd2.conf1':
      content    =>   template  ('apache2/vhost.erb'),
      mode       =>   '0755',
      notify     =>   Service['httpd']
    }
  
}
