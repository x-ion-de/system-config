#
# Top-level variables
#
# There must not be any whitespace between this comment and the variables or
# in between any two variables in order for them to be correctly parsed and
# passed around in test.sh
#
$elasticsearch_nodes = [
]
$elasticsearch_clients = [
]
#
# Default: should at least behave like an openstack server
#
node default {
  class { 'openstack_project::server':
    sysadmins => hiera('sysadmins', []),
  }
}

#
# Long lived servers:
#
# Node-OS: precise
node 'review.openstack-ci.berlin.x-ion.de' {
  class { 'openstack_project::review':
    project_config_repo                 => 'https://gitlab.x-ion.de/openstack/project-config',
    github_oauth_token                  => hiera('gerrit_github_token', 'XXX'),
    github_project_username             => hiera('github_project_username', 'username'),
    github_project_password             => hiera('github_project_password', 'XXX'),
    mysql_host                          => hiera('gerrit_mysql_host', 'localhost'),
    mysql_password                      => hiera('gerrit_mysql_password', 'XXX'),
    email_private_key                   => hiera('gerrit_email_private_key', 'XXX'),
    gerritbot_password                  => hiera('gerrit_gerritbot_password', 'XXX'),
    gerritbot_ssh_rsa_key_contents      => hiera('gerritbot_ssh_rsa_key_contents', 'XXX'),
    gerritbot_ssh_rsa_pubkey_contents   => hiera('gerritbot_ssh_rsa_pubkey_contents', 'XXX'),
    ssl_cert_file_contents              => hiera('gerrit_ssl_cert_file_contents', 'XXX'),
    ssl_key_file_contents               => hiera('gerrit_ssl_key_file_contents', 'XXX'),
    ssl_chain_file_contents             => hiera('gerrit_ssl_chain_file_contents', 'XXX'),
    ssh_dsa_key_contents                => hiera('gerrit_ssh_dsa_key_contents', 'XXX'),
    ssh_dsa_pubkey_contents             => hiera('gerrit_ssh_dsa_pubkey_contents', 'XXX'),
    ssh_rsa_key_contents                => hiera('gerrit_ssh_rsa_key_contents', 'XXX'),
    ssh_rsa_pubkey_contents             => hiera('gerrit_ssh_rsa_pubkey_contents', 'XXX'),
    ssh_project_rsa_key_contents        => hiera('gerrit_project_ssh_rsa_key_contents', 'XXX'),
    ssh_project_rsa_pubkey_contents     => hiera('gerrit_project_ssh_rsa_pubkey_contents', 'XXX'),
    ssh_welcome_rsa_key_contents        => hiera('welcome_message_gerrit_ssh_private_key', 'XXX'),
    ssh_welcome_rsa_pubkey_contents     => hiera('welcome_message_gerrit_ssh_public_key', 'XXX'),
    ssh_replication_rsa_key_contents    => hiera('gerrit_replication_ssh_rsa_key_contents', 'XXX'),
    ssh_replication_rsa_pubkey_contents => hiera('gerrit_replication_ssh_rsa_pubkey_contents', 'XXX'),
    lp_sync_consumer_key                => hiera('gerrit_lp_consumer_key', 'XXX'),
    lp_sync_token                       => hiera('gerrit_lp_access_token', 'XXX'),
    lp_sync_secret                      => hiera('gerrit_lp_access_secret', 'XXX'),
    contactstore_appsec                 => hiera('gerrit_contactstore_appsec', 'XXX'),
    contactstore_pubkey                 => hiera('gerrit_contactstore_pubkey', 'XXX'),
    sysadmins                           => hiera('sysadmins', []),
    swift_username                      => hiera('swift_store_user', 'username'),
    swift_password                      => hiera('swift_store_key', 'XXX'),
  }
}

# Node-OS: precise
node 'jenkins.openstack-ci.berlin.x-ion.de' {
  class { 'openstack_project::jenkins':
    project_config_repo     => 'https://gitlab.x-ion.de/openstack/project-config',
    jenkins_jobs_password   => hiera('jenkins_jobs_password', 'XXX'),
    jenkins_ssh_private_key => hiera('jenkins_ssh_private_key_contents', 'XXX'),
    ssl_cert_file_contents  => hiera('jenkins_ssl_cert_file_contents', 'XXX'),
    ssl_key_file_contents   => hiera('jenkins_ssl_key_file_contents', 'XXX'),
    ssl_chain_file_contents => hiera('jenkins_ssl_chain_file_contents', 'XXX'),
    sysadmins               => hiera('sysadmins', []),
    zmq_event_receivers     => ['logstash.openstack-ci.berlin.x-ion.de',
                                'nodepool.openstack-ci.berlin.x-ion.de',
                                'nodepool-dev.openstack-ci.berlin.x-ion.de',
    ],
  }
}

# Node-OS: precise
node /^jenkins\d+\.openstack-ci\.berlin\.x-ion\.de$/ {
  class { 'openstack_project::jenkins':
    jenkins_jobs_password   => hiera('jenkins_jobs_password', 'XXX'),
    jenkins_ssh_private_key => hiera('jenkins_ssh_private_key_contents', 'XXX'),
    ssl_cert_file           => '/etc/ssl/certs/ssl-cert-snakeoil.pem',
    ssl_key_file            => '/etc/ssl/private/ssl-cert-snakeoil.key',
    ssl_chain_file          => '',
    sysadmins               => hiera('sysadmins', []),
    zmq_event_receivers     => ['logstash.openstack-ci.berlin.x-ion.de',
                                'nodepool.openstack-ci.berlin.x-ion.de',
                                'nodepool-dev.openstack-ci.berlin.x-ion.de',
    ],
  }
}

# Node-OS: precise
node 'jenkins-dev.openstack-ci.berlin.x-ion.de' {
  class { 'openstack_project::jenkins_dev':
    jenkins_ssh_private_key  => hiera('jenkins_dev_ssh_private_key_contents', 'XXX'),
    sysadmins                => hiera('sysadmins', []),
    mysql_password           => hiera('nodepool_dev_mysql_password', 'XXX'),
    mysql_root_password      => hiera('nodepool_dev_mysql_root_password', 'XXX'),
    nodepool_ssh_private_key => hiera('jenkins_dev_ssh_private_key_contents', 'XXX'),
    jenkins_api_user         => hiera('jenkins_dev_api_user', 'username'),
    jenkins_api_key          => hiera('jenkins_dev_api_key', 'XXX'),
    jenkins_credentials_id   => hiera('jenkins_dev_credentials_id', 'XXX'),
    hpcloud_username         => hiera('nodepool_hpcloud_username', 'username'),
    hpcloud_password         => hiera('nodepool_hpcloud_password', 'XXX'),
    hpcloud_project          => hiera('nodepool_hpcloud_project', 'XXX'),
  }
}

# Node-OS: precise
node 'puppetmaster.openstack-ci.berlin.x-ion.de' {
  class { 'openstack_project::puppetmaster':
    root_rsa_key => hiera('puppetmaster_root_rsa_key', 'XXX'),
    sysadmins    => hiera('sysadmins', []),
    version      => '3.',
  }
}

# Node-OS: precise
node 'puppetdb.openstack-ci.berlin.x-ion.de' {
  class { 'openstack_project::puppetdb':
    sysadmins => hiera('sysadmins', []),
  }
}

# Node-OS: precise
node 'paste.openstack-ci.berlin.x-ion.de' {
  class { 'openstack_project::paste':
    db_host     => hiera('paste_db_host', 'localhost'),
    db_password => hiera('paste_db_password', 'XXX'),
    sysadmins   => hiera('sysadmins', []),
  }
}

# Node-OS: precise
node 'etherpad-dev.openstack-ci.berlin.x-ion.de' {
  class { 'openstack_project::etherpad_dev':
    mysql_host          => hiera('etherpad-dev_db_host', 'localhost'),
    mysql_user          => hiera('etherpad-dev_db_user', 'username'),
    mysql_password      => hiera('etherpad-dev_db_password', 'XXX'),
    sysadmins           => hiera('sysadmins', []),
  }
}

# Node-OS: precise
node 'zuul.openstack-ci.berlin.x-ion.de' {
  class { 'openstack_project::zuul_prod':
    project_config_repo            => 'https://gitlab.x-ion.de/openstack/project-config',
    gerrit_server                  => 'review.openstack-ci.berlin.x-ion.de',
    gerrit_user                    => 'jenkins',
    gerrit_ssh_host_key            => hiera('gerrit_ssh_rsa_pubkey_contents', 'XXX'),
    zuul_ssh_private_key           => hiera('zuul_ssh_private_key_contents', 'XXX'),
    url_pattern                    => 'http://logs.openstack-ci.berlin.x-ion.de/{build.parameters[LOG_PATH]}',
    swift_authurl                  => 'https://identity.api.rackspacecloud.com/v2.0/',
    swift_user                     => 'infra-files-rw',
    swift_key                      => hiera('infra_files_rw_password', 'XXX'),
    swift_tenant_name              => hiera('infra_files_tenant_name', 'tenantname'),
    swift_region_name              => 'DFW',
    swift_default_container        => 'infra-files',
    swift_default_logserver_prefix => 'http://logs.openstack-ci.berlin.x-ion.de/',
    zuul_url                       => 'http://zuul.openstack-ci.berlin.x-ion.de/p',
    sysadmins                      => hiera('sysadmins', []),
    statsd_host                    => 'graphite.openstack-ci.berlin.x-ion.de',
    gearman_workers                => [
      'nodepool.openstack-ci.berlin.x-ion.de',
      'nodepool-dev.openstack-ci.berlin.x-ion.de',
      'jenkins.openstack-ci.berlin.x-ion.de',
      'jenkins01.openstack-ci.berlin.x-ion.de',
      'jenkins02.openstack-ci.berlin.x-ion.de',
      'jenkins03.openstack-ci.berlin.x-ion.de',
      'jenkins04.openstack-ci.berlin.x-ion.de',
      'jenkins05.openstack-ci.berlin.x-ion.de',
      'jenkins06.openstack-ci.berlin.x-ion.de',
      'jenkins07.openstack-ci.berlin.x-ion.de',
      'jenkins-dev.openstack-ci.berlin.x-ion.de',
      'zm01.openstack-ci.berlin.x-ion.de',
      'zm02.openstack-ci.berlin.x-ion.de',
      'zm03.openstack-ci.berlin.x-ion.de',
      'zm04.openstack-ci.berlin.x-ion.de',
      'zm05.openstack-ci.berlin.x-ion.de',
      'zm06.openstack-ci.berlin.x-ion.de',
      'zm07.openstack-ci.berlin.x-ion.de',
      'zm08.openstack-ci.berlin.x-ion.de',
    ],
  }
}

# Node-OS: precise
node /^zm\d+\.openstack-ci\.berlin\.x-ion\.de$/ {
  class { 'openstack_project::zuul_merger':
    gearman_server       => 'zuul.openstack-ci.berlin.x-ion.de',
    gerrit_server        => 'review.openstack-ci.berlin.x-ion.de',
    gerrit_user          => 'jenkins',
    gerrit_ssh_host_key  => hiera('gerrit_ssh_rsa_pubkey_contents', 'XXX'),
    zuul_ssh_private_key => hiera('zuul_ssh_private_key_contents', 'XXX'),
    sysadmins            => hiera('sysadmins', []),
  }
}

# Node-OS: centos6
# Node-OS: precise
# Node-OS: trusty
# This is not meant to be an actual node that connects to the master.
# This is a dummy node definition to trigger a test of the code path used by
# nodepool's prepare_node scripts in the apply tests
node 'single-use-slave' {
  class { 'openstack_project::single_use_slave':
    # Test non-default values from prepare_node_bare.sh
    sudo => true,
    thin => false,
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
