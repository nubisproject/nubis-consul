# Not supported by the datadog puppet module yet
file { "/etc/dd-agent/conf.d/consul.yaml":
    ensure => present,
    owner  => "root",
    group  => "root",
    mode   => '0644',
    source => 'puppet:///nubis/files/consul-datadog.yaml',
}

