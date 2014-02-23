#!/bin/bash -eux

# Prepare puppetlabs repo
wget http://apt.puppetlabs.com/puppetlabs-release-wheezy.deb
dpkg -i puppetlabs-release-wheezy.deb
apt-get -y update

apt-get install -y puppet=3.1.1-1puppetlabs1 puppet-common=3.1.1-1puppetlabs1

mkdir /etc/puppet
cat << EOF > /etc/puppet/hiera.yaml
---
:backends: - yaml
:logger: console
:hierarchy: - %{hostname}
            - common
:yaml:
   :datadir: /vagrant/hieradata
:puppet:
   :datasource: data
EOF
