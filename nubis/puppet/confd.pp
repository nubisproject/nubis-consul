# We need to tell confd about the proper ACL to use
# Unfortunately, confd doesn't natively support this yet
# https://github.com/kelseyhightower/confd/issues/146

case $::osfamily {
  default: {
    $confd_defaults = "/etc/sysconfig/confd"
  }
  'Debian': {
    $confd_defaults = "/etc/default/confd"
  }
}

file { $confd_defaults:
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0755',
    source => 'puppet:///nubis/files/confd.defaults',
}

