node[:deploy].each do |application, deploy|
	node[:environment_variables].each do |name, value|
		ENV["#{name}"] = "#{value}"
	end

	template "/usr/local/bin/environment.sh" do
		source "environment.sh.erb"
		mode "0755"
	   	owner deploy[:user]
    	group deploy[:group]
	end

	execute "/usr/local/bin/environment.sh" do
		action :run
	end
	
	#ENV["PATH"] = ENV["PATH"] + ":./node_modules/phantomjs/bin"
	
	#package "fontconfig" do
    	#	action :install # see actions section below
	#end
end
