#xtra_spec.rb

#----- CHECKING BAAS AGENT INSTALLATION -----#
describe command('ps -ef |grep cvlaunchd') do
	its(:stdout) { should match /opt\/hds\/Base\/cvlaunchd/ }
end
describe command('ps -ef |grep cvd') do
	its(:stdout) { should match /opt\/hds\/Base\/cvd/ }
end
describe command('ps -ef |grep EvMgrC') do
	its(:stdout) { should match /opt\/hds\/Base\/EvMgrC/ }
end

#----- CHECKING SYMANTEC ANTI VIRUS -----#
describe command('ps -ef |grep symcfgd') do
	its(:stdout) { should match /opt\/Symantec\/symantec_antivirus\/symcfgd/ }
end
describe command('ps -ef |grep rtvscand') do
	its(:stdout) { should match /opt\/Symantec\/symantec_antivirus\/rtvscand/ }
end
describe command('ps -ef |grep smcd') do
	its(:stdout) { should match /opt\/Symantec\/symantec_antivirus\/smcd/ }
end

#----- CHECKING FSTAB - NAS SETUP -----#
#describe file('/etc/fstab') do
	#housekeeping job cron setup verification
	#it(:content) {should have }
#end 

#----- CHECKING BONDING SETUP -----#
#describe bond('bond0') do
	#housekeeping job cron setup verification
	#it { should exist }
	#it { should have_interface 'eth0' }
#end 

#----- CHECKING CRON JOB SETUP -----#
#describe cron do
	#housekeeping job cron setup verification
	#it {should have entry '* * * * * /......./'}
	#it {should have_entry('* * * * * /.../').with_user('user') }
	# its(:table) {should match /<regex>/}
#end 

#----- CHECKING DNS SETUP -----#
#describe host('<hostname.') do
	#it { should be_resolvable}
	#it { should be_resolvable.by('dns') }
	#its(:ipv4_address) { should eq '1.2.3.4' }
#end 
