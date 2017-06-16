file { '/etc/nubis.d/instance_mfa':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0755',
    source => 'puppet:///nubis/files/instance_mfa',
}
