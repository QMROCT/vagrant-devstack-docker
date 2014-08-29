conf = {
  'ip' => '192.168.27.100',
  'box_name' => 'ubuntu/trusty64',
  'box_url' => 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box',
  'memory' => 3072,
  'cpus' => 1
}

Vagrant.configure('2') do |config|

  config.vm.network 'private_network', ip: conf['ip']

end

Vagrant::Config.run do |config|

  config.vm.box = conf['box_name']
  config.vm.box_url = conf['box_url']

  config.vm.customize ["modifyvm", :id, "--memory", conf['memory']]
  config.vm.customize ["modifyvm", :id, "--cpus", conf['cpus']]

  # For horizon
  config.vm.forward_port 80, 8080

  config.vm.provision :shell, :inline =>
    "cp /vagrant/load.sh .; su vagrant -c './load.sh'"
end
