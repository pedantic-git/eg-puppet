class indirection_one {

    class {'indirection_two': }

    file {'/tmp/indirection_one':
        ensure => file;
    }
}
