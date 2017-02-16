#require 'spec_helper'
#require 'serverspec'
#require 'pathname'
#require 'net/ssh'
#require 'highline/import'
require 'logon_helper'

# --- test out whoami --- #s
describe command('whoami') do
	its(:stdout) { should match 'root'} 
end

puts "#{@target_server} is now being reviewed..."

# --- Server and OS Verification --- #
host_name = host_inventory['hostname']
host_platform = host_inventory['platform']
host_platform_ver = host_inventory['platform_version']

#describe file('/etc/sysconfig/network') do
#	its(:content) { should match /HOSTNAME=#{host_name}/ }
#end

describe host_platform do
	it  {should eq 'redhat'}
end

describe host_platform_ver do
	it  {should eq '7.2'}
end

=begin

# --- Connectivity Verification <to be discussed> --- #
describe host('intracx') do
	it { should_be reachable }
	it { should be_resolvable }
	it { should be_resolvable.by('dns') }
end
=end