$asg_route53_version = 'v0.0.2-beta3'

staging::file { '/usr/local/bin/asg-route53':
  source => "https://github.com/gozer/asg-route53/releases/download/${asg_route53_version}/asg-route53.${asg_route53_version}-linux_amd64",
  target => '/usr/local/bin/asg-route53',
}
->exec { 'chmod asg-route53':
  command => 'chmod 755 /usr/local/bin/asg-route53',
  path    => ['/usr/bin','/bin'],
}
