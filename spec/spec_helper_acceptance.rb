require 'beaker-rspec'

hosts.each do |host|
  # Install Puppet
  # Install Puppet
  if host['platform'] =~ /el-(5|6)/
    relver = $1
    on host, "rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-#{relver}.noarch.rpm", { :acceptable_exit_codes => [0,1] }
    on host, 'yum install -y puppet puppet-server', { :acceptable_exit_codes => [0,1] }
    on host, 'service puppetmaster start', { :acceptable_exit_codes => [0,1] }
  end
end

RSpec.configure do |c|
  # Project root
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  # Readable test descriptions
  c.formatter = :documentation

  c.add_setting :blcr_yumrepo_baseurl
  c.blcr_yumrepo_baseurl = ENV['BEAKER_blcr_yumrepo_baseurl']

  # Configure all nodes in nodeset
  c.before :suite do
    RSpec.configuration.blcr_yumrepo_baseurl.should_not be_nil

    # Install module and dependencies
    puppet_module_install(:source => proj_root, :module_name => 'blcr')

    hosts.each do |host|
      on host, puppet('module', 'install', 'puppetlabs-stdlib', '--version', '">=3.2.0 <5.0.0"'), { :acceptable_exit_codes => [0,1] }
    end
  end
end