#!/bin/bash
set -x

# Script to build a puppet 3 master to infra/system-config standards

sudo apt-get update
sudo apt-get install git
git clone https://git.openstack.org/x-ion-de/system-config

cd system-config

cat > manifests/local.pp <<EOF
node default {
  class { 'openstack_project::puppetmaster':
    root_rsa_key => hiera('puppetmaster_root_rsa_key', 'XXX'),
    sysadmins    => hiera('sysadmins', []),
    version      => '3.',
    ca_server    => 'puppet-master.openstack-ci.berlin.x-ion.de',
    puppetdb     => false,
  }
}
EOF

export PUPPET_VERSION=3
sudo ./install_puppet.sh
sudo ./install_modules.sh
sudo puppet apply  --modulepath=modules:/etc/puppet/modules manifests/local.pp
