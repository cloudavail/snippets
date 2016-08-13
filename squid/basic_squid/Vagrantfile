vagrantfile_api_version = "2"

Vagrant.configure(vagrantfile_api_version) do |config|

  config.vm.box = "ubuntu/xenial64"
  config.vm.hostname = "squid"
  config.vm.network :forwarded_port, guest: 3128, host: 3128
  config.vm.provision "shell", path: "./basic_squid_install.sh"

end
