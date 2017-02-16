#pamd_spec.rb

describe command('cat /etc/pam.d/password-auth') do
	# Hardening guide - 3.4.3 Lockout policy 
	its(:stdout) { should match /auth.*required.*pam_faillock.so.*preauth audit silent deny=5 unlock_time=900/}
	# Hardening guide - 3.4.3 Lockout policy 
	its(:stdout) { should match /auth.*success=1.default=bad.*pam_unix.so/ }
	# Hardening guide - 3.4.3 Lockout policy 
	its(:stdout) { should match /auth.*default=die.*pam_faillock.so.*authfail audit deny=5/ }
	# Hardening guide - 3.4.3 Lockout policy 
	its(:stdout) { should match /auth.*sufficient.*pam_faillock.so.*authsucc.*audit.*deny=5.*unlock_time=90/ }
	# Hardening guide - 3.4.3 Lockout policy 
	its(:stdout) { should match /auth.*pam_deny.so/ }
end

#describe command('egrep -v "^\+" /etc/passwd | awk -F: '"'"'($1!="root" && $1!="sync" && $1!="shutdown" && $1!="halt" && $3<1000 && $7!="/sbin/nologin") {print} '"'"'' ) do
describe command('egrep -v "^\+" /etc/passwd | awk -F: '"'"'($1!="root" && $1!="sync" && $1!="shutdown" && $1!="halt" && $3<1000 && $7!="/sbin/nologin") {print} '"'"' | egrep -v '"'"'(sscope|pimsrcon|addmscan|ansible)'"'"' ') do
	# Hardening guide - 3.4.5 disable logon shell
	# To revisit the following accounts except they are 'sscope|pimscron|addmscan|ansible'
	its(:stdout) { should eq '' }		
end

# check no id is older than 180 days
describe command('useradd -D -f 180') do
	# Hardening guide - 3.4.6 Lock/deactivate inactive user account
	its(:stdout) { should match //}		
end

describe file('/etc/profile.d/tmout.sh') do
	# Hardening guide - 3.6 User account timeout
	it { should be_file }
	# Hardening guide - 3.6 User account timeout
	it { should exist}
	# Hardening guide - 3.6 User account timeout
	its(:content) { should match /^TMOUT=1800/ }
	# Hardening guide - 3.6 User account timeout
	its(:content) { should match /^export\s*TMOUT/ }
	# Hardening guide - 3.6 User account timeout
	its(:content) { should match /^readonly\s*TMOUT/ }
end
 

describe file('/etc/profile.d/autologout.csh') do
	# Hardening guide - 3.6 User account timeout
	it { should be_file }
	it { should exist}
	it { should be_mode 755 }
	it { should be_owned_by 'root' }
	it { should be_grouped_into 'root' }
	# Hardening guide - 3.6 User account timeout
	its(:content) { should match /set -r autologout 30/}
	
end

describe command('cat /etc/securetty') do
	# Hardening guide - 3.6 User account timeout
	its(:stdout) { should match /^console$/ }
	its(:stdout) { should match /^tty[1-8]$/ }
	its(:stdout) { should match /^vc\/[1-2]$/ }
end

describe command('grep "^root:" /etc/passwd |cut -f4 -d:') do
	# Hardening guide - 3.7.1 default group for root
	its(:stdout) { should match /0/ }		
end

describe command('cat /etc/passwd | awk -F: '"'"'$3 == 0 { print $1 }'"'"'') do
	# Hardening guide - 3.7.2 no UID 0
	its(:stdout) { should match /^root$/ }
end

describe command('stat -L -c "%u %g" /boot/grub2/grub.cfg | egrep "0 0"') do
	# Hardening guide - 3.8 - secure boot setting - egrep "0 0"
	its(:stdout) { should match /0 0/ }
end

describe command('cat /etc/sysctl.conf') do
	# Hardening guide - 3.9 - Virtual Memory Hardening
	its(:stdout) { should match /kernel.randomize_va_space\s=\s2/ }
end
