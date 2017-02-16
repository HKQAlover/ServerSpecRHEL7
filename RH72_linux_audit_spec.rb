#linux_audit_spec.rb

# Linux Audit system enablement

describe linux_audit_system do
 	it {should be_running}
 	it {should be_enabled}
 	its(:rules) { should include 'w /etc/sudoers -p wa -k actions' }
 	its(:rules) { should include 'w /etc/sudoers.d/ -p wa -k actions' }
end

describe file('/var/log/audit/audit.log') do
	it {should be_file}
	it {should exist}	
end

describe file('/etc/default/grub') do
	it {should be_file}
	it {should exist}	
	its(:content) { should match /audit=1/}
end
