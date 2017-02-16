#syslog_spec.rb

# Hardening checklist - 4.3.5 - rsyslogd configuration
describe file ('/etc/rsyslog.conf') do 
	it { should exist} 
	it { should be_file}
	its (:content) { should match /auth.*\/var\/log\/messages/ }
	its (:content) { should match /user.*\/var\/log\/messages/ }
	its (:content) { should match /kern.*\/var\/log\/kern/ }
	its (:content) { should match /daemon.*\/var\/log\/daemon/ }
	its (:content) { should match /lpr.*\/var\/log\/unused/ }
	its (:content) { should match /news.*\/var\/log\/unused/ }
	its (:content) { should match /uucp.*\/var\/log\/unused/ }
	its (:content) { should match /local.*\/var\/log\/unused/ }

end

# Hardening checklist - 4.3.5 - rsyslogd configuration
describe file ('/var/log/kern.log') do
	it { should exist} 
	it { should be_file}
	it { should be_mode 600 }
	it { should be_owned_by 'root' }
	it { should be_grouped_into 'root' }
end 

# Hardening checklist - 4.3.5 - rsyslogd configuration
describe file ('/var/log/daemon.log') do
	it { should exist} 
	it { should be_file}
	it { should be_mode 600 }
	it { should be_owned_by 'root' }
	it { should be_grouped_into 'root' }
end 

# Hardening checklist - 4.3.5 - rsyslogd configuration
describe file ('/var/log/unused.log') do
	it { should exist} 
	it { should be_file}
	it { should be_mode 600 }
	it { should be_owned_by 'root' }
	it { should be_grouped_into 'root' }
end 

# Hardening checklist - 4.3.5 - rsyslogd configuration
describe file ('/etc/logrotate.d/syslog') do
	it { should exist} 
	it { should be_file}
end 

# Hardening checklist - 4.3. - sendmail disablement
describe file ('/etc/sysconfig/sendmail') do
	it { should exist} 
	it { should be_file}
	its (:content) { should match /DAEMON=NO|DAEMON=no/ }
end 

#-------- AUDIT -------#

# Hardening checklist - 4.3.2 - system auditing with auditd
describe file ('/var/log/audit/audit.log') do
	it { should exist} 
	it { should be_file}
end 

describe file ('/etc/default/grub') do
	it { should exist} 
	it { should be_file}
	its (:content) { should match /GRUB_CMDLINE_LINUX.*audit=1/}
end 
