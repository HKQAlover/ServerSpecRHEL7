#tcpwrapper_spec.rb

describe command ('ldd /path/to/daemon | grep libwrap.so ')  do 
	its(:stdout) { should match /No such file or directory/}
end
