#------------------- NTP POLICY CHECK 
#------------------- NTP.CONF verifications 

# HARDENING GUIDE - 6.3 - NTP customization
describe command('cat /etc/ntp.conf') do
	# Time Source checking
	#its(:stdout) { should match /^server 10.208.129.39 prefer|^server 10.209.129.40|^server 10.210.135.28/ } 
	
	# NTP Configuration 
	its(:stdout) { should match /restrict\sdefault\skod\snomodify\snotrap\snopeer\snoquery/ } 
	its(:stdout) { should match /restrict\s-6\sdefault\skod\snomodify\snotrap\snopeer\snoquery/ } 
end

# HARDENING GUIDE - 6.3 - NTP customization
describe command('ntpstat') do
	its(:stdout) { should match /synchronised to NTP server/ }
end

# HARDENING GUIDE - 6.3 - NTP customization
describe command('ps -ef |grep ntp') do
	its(:stdout) { should match /^ntp/ }
end

# HARDENING GUIDE - 6.3 - NTP customization
describe file('/etc/sysconfig/ntpd') do
	it {should exist}
	it {should be_file}
	its(:content) { should match /OPTIONS=.*-x -u.*ntp:ntp -p \/var\/run\/ntpd.pid/ } 
	its(:content) { should match /^SYNC_HWCLOCK=NO|^SYNC_HWCLOCK=no/ } 
end
