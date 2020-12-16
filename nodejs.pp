class { 'nodejs':
  repo_url_suffix => '12.7',

    exec { 'npm install'
        command => 'npm install',
        path => '/home/ubuntu/backend'
    }


    exec { 'npm install'
        command => 'node . &',
        path => '/home/ubuntu/backend'
    }

}