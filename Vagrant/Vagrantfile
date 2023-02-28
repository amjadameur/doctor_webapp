Vagrant.configure("2") do |config|
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true


  # MYSQL VM
  config.vm.define "db01" do |db01|
    db01.vm.box = "ubuntu/bionic64"
    db01.vm.hostname = "db01"
    db01.vm.network "private_network", ip: "192.168.62.100"
    db01.vm.provision "shell", path: "mysql.sh"
  end

  # WEBSERVER VM
  config.vm.define "web01" do |web01|
    web01.vm.box = "ubuntu/bionic64"
    web01.vm.hostname = "web01"
    web01.vm.network "private_network", ip: "192.168.62.101"
    web01.vm.provision "shell", path: "web.sh"
  end
end
