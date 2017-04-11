class { 'consul':
  version          => '0.7.5',
  purge_config_dir => false,
  manage_service   => false,
  service_enable   => false,
  service_ensure   => 'stopped',

  config_hash      => {
      'data_dir'           => '/var/lib/consul',
      'log_level'          => 'INFO',
      'ui_dir'             => '/var/lib/consul/ui',
      'client_addr'        => '0.0.0.0',
      'leave_on_terminate' => true,
      'server'             => true,
      'enable_syslog'      => true,
      'telemetry'          => {
        'dogstatsd_addr'   => '127.0.0.1:8125',
        'statsd_address'   => '127.0.0.1:9125',
        'disable_hostname' => true,
      },
      'dns_config'         => {
          'enable_truncate' => true,
      },
  }
}

package { 'libwww-perl':
  ensure => present,
}

package { 'libjson-perl':
  ensure => present,
}

package { 'liblwp-useragent-determined-perl':
  ensure => present,
}

file { '/usr/local/bin/consul-get-or-set':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0755',
    source  => 'puppet:///nubis/files/consul-get-or-set',
    require => [
      Package['libwww-perl'],
      Package['libjson-perl'],
      Package['liblwp-useragent-determined-perl'],
    ],
}

file { '/etc/nubis.d/0-consul-server-bootstrap':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0755',
    source => 'puppet:///nubis/files/consul-server-bootstrap',
}

file { '/etc/nubis.d/01-consul-server-join':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0755',
    source => 'puppet:///nubis/files/consul-server-join',
}

file { '/usr/local/bin/consul-post-bootstrap':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0755',
    source => 'puppet:///nubis/files/consul-post-bootstrap',
}

file { '/etc/default/consul':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///nubis/files/consul.default',
}

file { '/usr/local/bin/consul-aws-join':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0755',
    source => 'puppet:///nubis/files/consul-aws-join',
}

# Install consul backup script and create cron for it
file { '/usr/local/sbin/consul-backup':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0755',
    source => 'puppet:///nubis/files/consul-backup',
}

cron::hourly { 'consul_backup':
    minute      => '0',
    user        => 'root',
    command     => 'nubis-cron consul_backup /usr/local/sbin/consul-backup',
    environment => [ 'PATH="/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin"', 'SHELL=/bin/bash' ],
    require     => File['/usr/local/sbin/consul-backup']
}
