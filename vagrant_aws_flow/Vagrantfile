vagrantfile_api_version = "2"

Vagrant.configure(vagrantfile_api_version) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = 'apache2'
  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.synced_folder "./", "/srv/vaf/"

  config.vm.provision(:shell, path: './deploy/deploy.sh')

end
