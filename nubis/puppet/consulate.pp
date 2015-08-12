# installs consulate, but assumes that its ubuntu
# amazon linux does funky things with packaging and upstream
# python puppet module does not have the same package name for python-pip

class { 'python':
    pip => true,
}

python::pip { 'consulate':
    ensure => present,
    name   => 'consulate'
}
