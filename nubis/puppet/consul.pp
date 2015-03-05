class { 'consul'=>
  version => '0.5.0',
  
  config_hash => {
      'data_dir'        => '/var/lib/consul',
      'log_level'       => 'INFO',
      'ui_dir'          => '/var/lib/consul/ui',
      'client_addr'     => '0.0.0.0',
      'server'          => true,
      'enable_syslog'   => true,
      'ca_file'         => '/etc/consul/consul.pem',
      'cert_file'       => '/etc/consul/consul.pem',
      'key_file'        => '/etc/consul/consul.key',
      'verify_incoming' => true,
      'verify_outgoing' => true

  }
}
