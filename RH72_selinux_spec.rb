#selinux_spec.rb
=begin

describe selinux do
	# Hardening guide - 7
	it { should be_permissive}
end

describe selinux do
	# Hardening guide - 7.1
	it { should be_permissive.with_policy('targeted')}
end


describe selinux_module('coreutils-libs') do
	# Hardening guide - 7.2
	it { should be_enabled }
end

describe selinux_module('coreutils') do
	# Hardening guide - 7.2
	it { should be_enabled }
end

describe selinux_module('policycoreutils-gui') do
	# Hardening guide - 7.2
	it { should be_enabled }
end

describe selinux_module('policycoreutils') do
	# Hardening guide - 7.2
	it { should be_enabled }
end

describe selinux_module('policycoreutils-python') do
	# Hardening guide - 7.2
	it { should be_enabled }
end

describe selinux_module('settroubleshoot') do
	# Hardening guide - 7.2
	it { should be_disabled }
end

describe selinux_module('mcstrans') do
	# Hardening guide - 7.2
	it { should be_disabled }
end
=end