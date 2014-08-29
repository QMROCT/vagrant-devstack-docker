## [Vagrant](http://www.vagrantup.com/) based [Devstack](http://devstack.org/) with [Docker](https://www.docker.io/)

This Vagrant environment sets up an [Ubuntu 14.04](https://vagrantcloud.com/ubuntu/trusty64), installs [Devstack with Docker](https://github.com/stackforge/nova-docker/tree/master/contrib/devstack) and adds an example Docker container running an [SSH Daemon Service](https://docs.docker.com/examples/running_ssh_service/).

Horizon will be reachable at [`localhost:8080`](http://localhost:8080/).


### Usage

```bash
git clone https://github.com/QMROCT/vagrant-devstack-docker
cd vagrant-devstack-docker
vagrant up
# … wait …
vagrant ssh
source /opt/stack/devstack/openrc
nova boot --image docker-ssh --flavor 1 docker-ssh
ssh root@10.0.0.x
```

Read more about it on [wiki.openstack.org/Docker](https://wiki.openstack.org/wiki/Docker).


### Thanks
This repo is based on [DevstackUp](https://github.com/jogo/DevstackUp).