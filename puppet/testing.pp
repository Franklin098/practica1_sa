node default {

package {'apache2':

    ensure => installed,

}

package {'nodejs':

    ensure => installed,

}

file { '/tmp/status.txt':

    content => 'apache2 Installed on testing',
    mode => '0644',

}

}