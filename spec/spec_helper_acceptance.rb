require 'beaker-rspec/spec_helper'
require 'beaker-rspec/helpers/serverspec'

hosts.each do |host|
  install_puppet
  print host
end

print "puppet instlled"

UNSUPPORTED_PLATFORMS = ['Suse','windows','AIX','Solaris']

RSpec.configure do |c|
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  print proj_root

  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
    puppet_module_install(:source => proj_root, :module_name => 'apache1')
    hosts.each do |host|
      #puppet_module_install(:source => @proj_root, :module_name => 'apache1')
      print "module has been installed"
      on host, puppet('module','install','puppetlabs-stdlib'), { :acceptable_exit_codes => [0,1] }
     # on host, puppet('module', 'install', 'opentable-altlib'), { :acceptable_exit_codes => [0,1] }
    end
  end
end
