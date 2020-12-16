pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                dir('backend'){
                    nodejs('Node-12-7'){
                        sh 'echo hola !!'
                        sh 'npm install'
                        sh 'node . &'
                    }
                }
            }
        }
        stage('Test') {
            steps {
                nodejs('Node-12-7'){
                        dir('backend'){
                        sh 'npm test'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                sh 'cp testing.pp /etc/puppet/code/environments/testing/manifests'
                sh "ssh -n -f ubuntu@52.14.253.15 'sudo puppet agent --environment=testing --test' "

                sh 'cp production.pp /etc/puppet/code/environments/production/manifests'
                sh "ssh -n -f ubuntu@18.191.5.45 'sudo puppet agent --environment=production --test' "
            }
        }
    }
}