# -*- mode: ruby -*-
# vi: set ft=ruby :

#############################################################################################
## Uncomment the following in order to enable the installation of the proxy plugin, used to #
## apply the correct HTTP proxy settings to Vagrant.                                        #
#############################################################################################
# if !Vagrant.has_plugin?("vagrant-proxyconf") 
# 	system('vagrant plugin install vagrant-proxyconf --plugin-source http://rubygems.org')     
# 	raise("vagrant-proxyconf installed. Run command again.");
# end

if !Vagrant.has_plugin?("vagrant-docker-compose") 
	system('vagrant plugin install vagrant-docker-compose')     
	raise("vagrant-docker-compose installed. Run command again.");
end

Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

	#####################################################################################
	## Uncomment the following in order to configure the vagrant proxy plugin, used to  #
	## apply the correct HTTP proxy settings to Vagrant.                                #
	#####################################################################################
	# if Vagrant.has_plugin?("vagrant-proxyconf")
    #     config.proxy.http     = "http://proxy.mydomain.com:80/"
    #     config.proxy.https    = "http://proxy.mydomain.com:80/"
    #     config.proxy.no_proxy = "localhost,127.0.0.1,.example.com"
    # end

	# define and name vm
	config.vm.define "win_dev_env"
	config.vm.box = "ubuntu/trusty64"
	config.vm.box_check_update = false

	####################################################################################
	## Uncomment the following in order to enable the download of vbox images with     #
	## self-signed SSL certs                                                           #
	####################################################################################
	#config.vm.box_download_insecure = true

	# sync the parent dev folder to the guest linux vm
	config.vm.synced_folder '.', '/var/local/dev-env'

	# configure vm resources
	config.vm.provider :virtualbox do |v|
		v.name = "win_dev_env"
  		v.memory = 4096
  		v.cpus = 4
	end

	# ports 3000-3020 are forwarded from host machine to guest vm and can be used by app containers
	for i in 3000..3020
		config.vm.network :forwarded_port, host: i, guest: i
	end

	################
	# PROVISIONING #
	################
	config.vm.provision "shell", inline: <<-SHELL
		###########################################################################################
		## Uncomment the following in order to install proxy SSL certificates. You must first     #
		## create a folder named 'vm_proxy_certs' and add all SSL certs that should be installed. #
		###########################################################################################
		#sudo apt-get update -y
		#sudo cp -a /var/local/dev-env/vm_proxy_certs/. /usr/local/share/ca-certificates/
		#sudo update-ca-certificates

		sudo wget -qO- https://get.docker.com/ | sh
		sudo usermod -aG docker vagrant
		sudo chmod 755 /var/lib/docker/
		sudo service docker restart
	SHELL

	# install docker-compose
	config.vm.provision :docker_compose, compose_version: "1.9.0"

	# terminate all ssh connections as a new terminal session is required post docker installation
	config.vm.provision "shell", inline:
		"ps aux | grep 'sshd:' | awk '{print $2}' | xargs kill"

 	

end