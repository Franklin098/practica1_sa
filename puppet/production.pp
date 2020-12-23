node default {

package {'apache2':

    ensure => installed,

}

file { '/tmp/status.txt':

    content => 'Apache2 Installed',
    mode => '0644',

}

}