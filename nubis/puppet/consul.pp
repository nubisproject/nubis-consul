class { 'consul':
  version => '0.5.0',
  purge_config_dir => false,
  
  config_hash => {
      'data_dir'        => '/var/lib/consul',
      'log_level'       => 'INFO',
      'ui_dir'          => '/var/lib/consul/ui',
      'client_addr'     => '0.0.0.0',
      'server'          => true,
      'enable_syslog'   => true
  }
}
