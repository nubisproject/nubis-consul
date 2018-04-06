$statsd_exporter_version = '0.4.0'
$statsd_exporter_url = "https://github.com/prometheus/statsd_exporter/releases/download/v${statsd_exporter_version}/statsd_exporter-${statsd_exporter_version}.linux-amd64.tar.gz"

notice ("Grabbing statsd_exporter ${statsd_exporter_version}")
staging::file { "statsd_exporter.${statsd_exporter_version}.tar.gz":
  source => $statsd_exporter_url,
}
->staging::extract { "statsd_exporter.${statsd_exporter_version}.tar.gz":
  strip   => 1,
  target  => '/usr/local/bin',
  creates => '/usr/local/bin/statsd_exporter',
}

systemd::unit_file { 'statsd_exporter.service':
  source => 'puppet:///nubis/files/statsd_exporter.systemd',
}
