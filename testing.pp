node default {

package {'apache2':

    ensure => installed,

}

file { '/tmp/status.txt':

    content => 'apache2 Installed',
    mode => '0644',

}

}