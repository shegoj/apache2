require 'beaker-rspec/spec_helper'
require 'beaker-rspec/helpers/serverspec'

UNSUPPORTED_PLATFORMS = ['Suse','windows','AIX','Solaris']

@proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
puts @proj_root
@modules_directory = "#{@proj_root}/spec/fixtures/modules"

# Install modules, we should always run rake puppetfile:install before
hosts.each do |host|
  puppet_module_install(:source => @proj_root, :module_name => 'graphite')
  Dir.glob("#{@modules_directory}/*").each { |x| scp_to(host, x, host['distmoduledir']) unless File.symlink?(x) }
end

shell "sed '/^environment/d' /etc/puppetlabs/puppet/puppet.conf -i"

RSpec.configure do |c|
  c.formatter = :documentation
end
