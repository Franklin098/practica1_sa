node default {

package {'apache2':

    ensure => installed,

}

file { '/tmp/status.txt':

    content => 'Ngnix Installed',
    mode => '0644',

}

}