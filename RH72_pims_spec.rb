#PIMS_spec.rb
=begin
describe command( 'cat /etc/passwd | grep -v /nologin/ | grep -v /bin/false | awk -F":" '"'"'{print $1}'"'"' ') do 

#describe command( 'egrep -v '"'"'/nologin|/bin/false'"'"' /etc/passwd') do 

	# INTENTIONAL FALSE CASE TO LIST OUT THE USERS WITH LOGON
	its(:stdout) { should match 'testing123'}
end 
=end
#describe command('cat /etc/login.defs | grep ^PASS_MAX_DAYS ') do
	# Hardening guide - 3.4 Password policy 
#	its(:stdout) { should match /PASS_MAX_DAYS\s90/ } 
