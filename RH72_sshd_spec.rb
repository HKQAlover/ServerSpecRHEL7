# --- checking on the sshd configuration ---#

describe command('grep "^LogLevel" /etc/ssh/sshd_config') do
	#loglevel
	its(:stdout) { should match /LogLevel\s+INFO|LogLevel\s+info/}
	
end

describe command('grep "^Protocol" /etc/ssh/sshd_config') do
	#only protocol2
	its(:stdout) { should match /Protocol\s+2$/}
	
end

describe command('grep "^ClientAlive" /etc/ssh/sshd_config') do
	#ClientAlive Interval and CountMax
	its(:stdout) { should match /ClientAliveInterval\s+1800/}
	its(:stdout) { should match /ClientAliveCountMax\s+0/}

end

describe command('grep "^IgnoreRhosts" /etc/ssh/sshd_config') do
	#IgnoreRhosts
	its(:stdout) { should match /IgnoreRhosts\s+yes/}
end


describe command('grep "^PermitRootLogin" /etc/ssh/sshd_config') do
	#PermitRootLogin	
	its(:stdout) { should match /PermitRootLogin\s+no/}
end


describe command('grep "^PermitEmptyPasswords" /etc/ssh/sshd_config') do
	#PermitEmptyPassword
	its(:stdout) { should match /PermitEmptyPasswords\s+no/}
end

describe command('grep "Cathay" /etc/issue') do
	#Banner check
	its(:stdout) { should match /Cathay\s+Pacific/}
end
describe command('grep "Cathay" /etc/ssh/ssh-banner') do
	#Banner check
	its(:stdout) { should match /Cathay\s+Pacific/}
end

describe command('grep "^X11Forwarding" /etc/ssh/sshd_config') do
	#Xforward11
	its(:stdout) { should match /X11Forwarding\s+no/}
end

describe command('grep "^MaxAuthTries" /etc/ssh/sshd_config') do
	#MaxAuthTries Environment = no
	its(:stdout) { should match /MaxAuthTries\s+6/}
end

describe command('grep "^HostbasedAuthentication" /etc/ssh/sshd_config') do
	#HostbasedAuthentication = no
	its(:stdout) { should match /HostbasedAuthentication\s+no/}
end

describe command('grep "^PermitUserEnvironment" /etc/ssh/sshd_config') do
	#PermitUserEnvironment = no
	its(:stdout) { should match /PermitUserEnvironment\s+no/}
end

describe command('grep "^Ciphers" /etc/ssh/sshd_config') do
	#Good Cipher to use
	its(:stdout) { should match /Ciphers.*aes128-ctr/}
	its(:stdout) { should match /Ciphers.*aes192-ctr/}
	its(:stdout) { should match /Ciphers.*aes256-ctr/}

	#Bad Cipher to use
	its(:stdout) { should_not match /Ciphers.*arcfour/}
	its(:stdout) { should_not match /Ciphers.*md5/}
	
end
