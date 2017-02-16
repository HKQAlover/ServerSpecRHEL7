#cron_spec.rb

# Hardening checklist - 4.3.1 - crontab hardening
describe file ('/etc/crontab') do 
	it { should exist} 
	it { should be_file}
	it { should be_mode 600 }
	it { should be_owned_by 'root' }
	it { should be_grouped_into 'root' }
end

# Hardening checklist - 4.3.1 - crontab hardening
describe file ('/etc/anacrontab') do 
	it { should exist} 
	it { should be_file}
	it { should be_mode 600 }
	it { should be_owned_by 'root' }
	it { should be_grouped_into 'root' }
end

# Hardening checklist - 4.3.1 - crontab hardening
describe file ('/etc/cron.hourly') do 
	it { should exist} 
	it { should be_directory}
	it { should be_owned_by 'root' }
	it { should be_grouped_into 'root' }
end

# Hardening checklist - 4.3.1 - crontab hardening
describe file ('/etc/cron.daily') do 
	it { should exist} 
	it { should be_directory}
	it { should be_owned_by 'root' }
	it { should be_grouped_into 'root' }
end

# Hardening checklist - 4.3.1 - crontab hardening
describe file ('/etc/cron.weekly') do 
	it { should exist} 
	it { should be_directory}
	it { should be_owned_by 'root' }
	it { should be_grouped_into 'root' }
end

# Hardening checklist - 4.3.1 - crontab hardening
describe file ('/etc/cron.monthly') do 
	it { should exist} 
	it { should be_directory}
	it { should be_owned_by 'root' }
	it { should be_grouped_into 'root' }
end

# Hardening checklist - 4.3.1 - crontab hardening
describe file ('/etc/cron.d') do 
	it { should exist} 
	it { should be_directory}
	it { should be_owned_by 'root' }
	it { should be_grouped_into 'root' }
end


# Hardening checklist - 4.3.1 - crontab hardening
describe file ('/var/spool/cron') do 
	it { should exist} 
	it { should be_directory}
	it { should be_owned_by 'root' }
	it { should be_grouped_into 'root' }
end

# Hardening checklist - 4.3.1 - crontab hardening
describe file ('/etc/cron.allow') do 
	it { should exist} 
	it { should be_file}
end

# Hardening checklist - 4.3.1 - cron hardening
describe file ('/etc/cron.deny') do 
	it { should exist} 
	it { should be_file}
	its (:content) { should match /^daemon/} 
	its (:content) { should match /^bin/}
	its (:content) { should match /^nuucp/}
	its (:content) { should match /^smmsp/}
	its (:content) { should match /^listen/}
	its (:content) { should match /^gdm/}
	its (:content) { should match /^webservd/}
	its (:content) { should match /^nobody/}
	its (:content) { should match /^noaccess/}
	its (:content) { should match /^nobody4/}
	its (:content) { should match /^adm/}
	its (:content) { should match /^lp/}
	its (:content) { should match /^uucp/}
end

# Hardening checklist - 4.3.1 - cron hardening
describe file ('/etc/at.deny') do 
	it { should exist} 
	it { should be_file}
	its (:content) { should match /^daemon/}
	its (:content) { should match /^bin/}
	its (:content) { should match /^nuucp/}
	its (:content) { should match /^smmsp/}
	its (:content) { should match /^listen/}
	its (:content) { should match /^gdm/}
	its (:content) { should match /^webservd/}
	its (:content) { should match /^nobody/}
	its (:content) { should match /^noaccess/}
	its (:content) { should match /^nobody4/}
	its (:content) { should match /^adm/}
	its (:content) { should match /^lp/}
	its (:content) { should match /^uucp/}
end
