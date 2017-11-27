$lifecycled_version = 'v2.0.0-rc2'
$lifecycled_url = "https://github.com/lox/lifecycled/releases/download/${lifecycled_version}/lifecycled-linux-amd64"
$lifecycled_bin = '/usr/local/bin/lifecycled'

notice ("Grabbing lifecycled ${lifecycled_version}")
staging::file { "lifecycled.${lifecycled_version}":
  source => $lifecycled_url,
  target => $lifecycled_bin,
}->
exec { "chmod ${lifecycled_bin}":
  command => "chmod 755 ${lifecycled_bin}",
  path    => ['/sbin','/bin','/usr/sbin','/usr/bin','/usr/local/sbin','/usr/local/bin'],
}

file { '/etc/lifecycled':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///nubis/files/lifecycled.env',
}

file { '/usr/local/bin/nubis-consul-shutdown':
     ensure => file,
     owner  => root,
     group  => root,
     mode   => '0755',
    source => 'puppet:///nubis/files/consul-shutdown',
}

file { '/lib/systemd/system/lifecycled.service':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0755',
    source => 'puppet:///nubis/files/lifecycled.systemd',
}->
service { 'lifecycled':
  enable => true,
}

