file { "/etc/nubis.d/mig":
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0755',
    source => 'puppet:///nubis/files/mig',
}
