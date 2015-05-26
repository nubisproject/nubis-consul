class { 'consul':
  version => '0.5.2',
  purge_config_dir => false,
  manage_service => false,
  
  config_hash => {
      'data_dir'        => '/var/lib/consul',
      'log_level'       => 'INFO',
      'ui_dir'          => '/var/lib/consul/ui',
      'client_addr'     => '0.0.0.0',
      'server'          => true,
      'enable_syslog'   => true,
      'dns_config'      => {
          'enable_truncate' => true,
      },
  }
}
