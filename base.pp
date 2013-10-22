class {'indirection_one': }

exec {'base exec':
    command => '/bin/date +%T >> /tmp/base_exec',
    refreshonly => true,
    subscribe => Class['indirection_one'];
}

file {'/tmp/base_file':
    ensure => file,
    notify => Exec['base exec'];
}

class indirection_one {
    class {'indirection_two': }

    file {'/tmp/indirection_one':
        ensure => file;
    }
}

class indirection_two {
    file {'/tmp/indirection_two':
        ensure => file;
    }
}
