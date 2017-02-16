#resolve_spec.rb
=begin
describe command('cat /etc/resolv.conf') do 

	# SEARCH DOMAIN SEQUENCE
	its(:stdout) { should match /search.*cathaypacific.com.*/ }
	its(:stdout) { should match /search.*cpadm001.corp.cathaypacific.com.*/ }
	
	# NOT TO SEARCH DOMAIN SEQUENCE
	its(:stdout) { should_not match /search.*nwow001.corp.ete.cathaypacific.com.*/ }
	its(:stdout) { should_not match /search.*esit.ete.cathaypacific.com.*/ }
	its(:stdout) { should_not match /search.*ete.cathaypacific.com.*/ }

	# DEFINITION OF THE NAME SERVERS
	its(:stdout) { should match /nameserver\s10.208.143.114/}
	its(:stdout) { should match /nameserver\s10.210.145.68/}
	
end
=end