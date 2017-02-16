#---------------- PASSWORD POLICY CHECK 

#------------------- /etc/login.defs verifications 

describe command('cat /etc/login.defs | grep ^PASS_MAX_DAYS') do
	# Hardening guide - 3.4 Password policy 
	its(:stdout) { should match /PASS_MAX_DAYS\s*90/ } 
end

describe command('cat /etc/login.defs | grep ^PASS_MIN_DAYS') do
	# Hardening guide - 3.4 Password policy 
	its(:stdout) { should match /PASS_MIN_DAYS\s*1/ }
end
describe command('cat /etc/login.defs | grep ^PASS_MIN_LEN') do
	# Hardening guide - 3.4 Password policy 
	its(:stdout) { should match /PASS_MIN_LEN\s*8/ }
end
describe command('cat /etc/login.defs | grep ^PASS_WARN_AGE') do
	# Hardening guide - 3.4 Password policy 
	its(:stdout) { should match /PASS_WARN_AGE\s*0/ }
end
# check on the hashing algorithm
describe command('authconfig --test | grep hashing') do
	# Hardening guide - 3.4.1 Password policy 
	its(:stdout) { should match /sha512/}
end

describe command('cat /etc/pam.d/system-auth') do
	# Hardening guide - 3.4.2 Password policy 
	its(:stdout) { should match /^password\s+required\s+pam_cracklib.so.*try_first_pass.*retry=3.*minlen=8.*dcredit=-1.*ucredit=-1.*ocredit=-1.*lcredit=-1/}
	# Hardening guide - 3.4.2 Password policy 
	its(:stdout) { should match /^password\s*sufficient\s*pam_unix.so.*remember=5/ }	
end
