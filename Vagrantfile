Vagrant.configure("2") do |config|
    config.vm.box = "avenuefactory/lamp"

    config.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 4
    end
    
    config.vm.network :forwarded_port, guest: 80, host: 8888
    config.vm.network :forwarded_port, guest: 3306, host: 3307

    config.vm.synced_folder "publichtml/", "/var/www/html"

    config.vm.network :private_network, ip: "192.168.10.10"

end