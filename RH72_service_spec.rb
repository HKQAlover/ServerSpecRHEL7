#service_spec.rb

#----------------  auditd should be enabled 
describe service('auditd') do
 	it { should be_enabled } #ENABLED according to CPA Hardening Guide
 	it { should be_running }
end

#----------------  autofs should be disabled
#describe service('autofs') do
 	it { should_not be_enabled}
#end


#----------------  crond should be disabled
describe service('crond') do
	it { should be_enabled }
 	it { should be_running }
end

#----------------  firewalld should be disabled
describe service('firewalld') do
 	it { should_not be_enabled}
end

#----------------  ip6tables should be disabled
#describe service('ip6tables') do
# 	it { should be_disabled}
#end

#----------------  iptables should be disabled
#describe service('iptables') do
#	it { should_not be_enabled}
#end

#----------------  irqbalance should be disabled
#describe service('irqbalance') do
	it { should_not be_enabled}
#end

#----------------  kdump should be enabled
describe service('kdump') do
 	it { should be_enabled } #ENABLED according to CPA Hardening Guide
 	it { should be_running }
end

#----------------  nfs-server should be disabled
describe service('nfs-server') do
 	it { should be_disabled}
end

#----------------  nfslock should be disabled
describe service('nfslock') do
 	it { should be_disabled}
end

#----------------  rpcbind should be disabled
describe service('rpcbind') do
 	it { should_not be_enabled}
end
# these 3 services could not be checked -> further manual action check required.

#----------------  network should be enabled
describe service('network') do
 	it { should be_enabled } #ENABLED according to CPA Hardening Guide
 	it { should be_running }
end

#----------------  postfix should be disabled
describe service('postfix') do
 	it { should_not be_enabled}
end
# these 3 services could not be checked -> further manual action check required.

#----------------  smartd should be enabled
describe service('smartd') do
 	it { should be_enabled } #ENABLED according to CPA Hardening Guide
 	it { should be_running }
end

#----------------  sshd should be enabled
describe service('sshd') do
 	it { should be_enabled } #ENABLED according to CPA Hardening Guide
 	it { should be_running }
end

#----------------  rsyslog should be enabled
describe service('rsyslog') do
 	it { should be_enabled } #ENABLED according to CPA Hardening Guide
 	it { should be_running }
end
