conf = {
  'ip' => '192.168.27.100',
  'box_name' => 'ubuntu/trusty64',
  'box_url' => 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box',
  'memory' => 3072,
  'cpus' => 1
}

Vagrant.configure('2') do |config|

  config.vm.network 'private_network', ip: conf['ip']

  config.vm.provider "virtualbox" do |v|
    v.memory = conf['memory'].to_s()
    v.cpus = conf['cpus']
  end

end

Vagrant::Config.run do |config|

  config.vm.box = conf['box_name']
  config.vm.box_url = conf['box_url']

  # For horizon
  config.vm.forward_port 80, 8080

  config.vm.provision :shell, :inline =>
    "cp /vagrant/load.sh .; su vagrant -c './load.sh'"
end
