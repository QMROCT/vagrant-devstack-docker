# From: https://get.docker.io/ubuntu/
echo 'deb https://get.docker.io/ubuntu docker main' | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
sudo apt-get update
sudo apt-get install -y git vim lxc-docker

# From: https://github.com/stackforge/nova-docker/tree/master/contrib/devstack
sudo chown vagrant /opt

git clone --depth 1 https://git.openstack.org/stackforge/nova-docker /opt/stack/nova-docker
git clone --depth 1 https://git.openstack.org/openstack-dev/devstack /opt/stack/devstack
git clone --depth 1 https://git.openstack.org/openstack/nova /opt/stack/nova

cd /opt/stack/nova-docker/contrib/devstack/
./prepare_devstack.sh

cd /opt/stack/devstack/
cp /vagrant/localrc .

./stack.sh
source openrc

cd /home/vagrant/
cp /vagrant/id_* .ssh/
cp /vagrant/Dockerfile .

sudo docker build -t docker-ssh .
sudo docker save docker-ssh | glance image-create --container-format=docker --disk-format=raw --name docker-ssh

# nova boot --image docker-ssh --flavor 1 docker-ssh
# ssh root@10.0.0.x