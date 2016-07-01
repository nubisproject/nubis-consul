# XXX: need to move to puppet-consul-replicate proper
staging::file { 'consul-replicate.tar.gz':
  source => "https://github.com/hashicorp/consul-replicate/archive/v0.2.0.tar.gz"
} ->
staging::extract { 'consul-replicate.tar.gz':
  strip   => 1,
  target  => "/usr/local/bin",
  creates => "/usr/local/bin/consul-replicate",
} ->
file { "/usr/local/bin/consul-replicate":
  owner =>  0,
  group =>  0,
  mode  => '0555',
}
