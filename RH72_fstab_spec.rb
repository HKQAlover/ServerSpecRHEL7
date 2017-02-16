#fstab_spec.rb-

#----------------  file tmp folder hardening
describe command('df --local -P | awk {'"'"'if (NR!=1) print$6'"'"'} | xargs -I '"'"'{}'"'"' find '"'"'{}'"'"' -xdev -type d \(-perm -0002 ! -perm -1000 \) 2>/dev/null') do

	# Hardening Guide - 2.3.2 - set sticky bit on all world writable directory
	its(:stdout) { should eq "" } 

end

describe command('cat /etc/fstab') do
	# Hardening Guide - 2.3.1/2.3.3 - /tmp and /var/tmp hardening
	its(:stdout) { should match /\s\/tmp.*nodev/ } 
	# Hardening Guide - 2.3.1/2.3.3 - /tmp and /var/tmp hardening
	its(:stdout) { should match /\s\/tmp.*noexec/ } 
	# Hardening Guide - 2.3.1/2.3.3 - /tmp and /var/tmp hardening
	its(:stdout) { should match /\s\/tmp.*nosuid/ } 
	# Hardening Guide - 2.3.3 - /home hardening
	its(:stdout) { should match /\s\/home.*nodev/ } 
	# Hardening Guide - 2.3.1
	its(:stdout) { should match /^\/tmp.*\/var\/tmp.*none.*bind.*0.*0/ } 
end

describe command ('/sbin/modprobe -n -v cramfs') do
	# Hardening Guide - 2.3.3 - restrict legacy system
	its(:stdout) { should match /install\s\/bin\/true/}
end

describe command ('/sbin/modprobe -n -v freevxfs') do
	# Hardening Guide - 2.3.3 - restrict legacy system
	its(:stdout) { should match /install\s\/bin\/true/}
end

describe command ('/sbin/modprobe -n -v jffs2') do
	# Hardening Guide - 2.3.3 - restrict legacy system
	its(:stdout) { should match /install\s\/bin\/true/}
end

describe command ('/sbin/modprobe -n -v hfs') do
	# Hardening Guide - 2.3.3 - restrict legacy system
	its(:stdout) { should match /install\s\/bin\/true/}
end

describe command ('/sbin/modprobe -n -v hfsplus') do
	# Hardening Guide - 2.3.3 - restrict legacy system
	its(:stdout) { should match /install\s\/bin\/true/}
end

describe command ('/sbin/modprobe -n -v udf') do
	# Hardening Guide - 2.3.3 - restrict legacy system
	its(:stdout) { should match /install\s\/bin\/true/}
end


describe file('/etc/passwd') do
	# Hardening Guide - 6.1.5 - system file permission /etc/passwd
	it { should exist} 
	it { should be_file}
	it { should be_mode 644 }
	it { should be_owned_by 'root' }
	it { should be_grouped_into 'root' }
end

describe file('/etc/shadow') do
	# Hardening Guide - 6.1.5 - system file permission /etc/shadow
	it { should exist} 
	it { should be_file}
	it { should be_mode 000 }
	it { should be_owned_by 'root' }
	it { should be_grouped_into 'root' }
end

describe file('/etc/shadow') do
	# Hardening Guide - 6.1.5 - system file permission /etc/gshadow
	it { should exist} 
	it { should be_file}
	it { should be_mode 000 }
	it { should be_owned_by 'root' }
	it { should be_grouped_into 'root' }
end

describe file('/etc/group') do
	# Hardening Guide - 6.1.5 - system file permission /etc/group
	it { should exist} 
	it { should be_file}
	it { should be_mode 644 }
	it { should be_owned_by 'root' }
	it { should be_grouped_into 'root' }
end
