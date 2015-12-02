#Class apache2::params
#-------------------------------------

class apache2::params  {

  $version        =   'installed'
  $configfile     =   '/etc/httpd/conf/httpd.conf'
  $port_number    =   '8081'
}