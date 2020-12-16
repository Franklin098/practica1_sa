pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                dir('backend'){
                    nodejs('Node-12-7'){
                        sh 'echo building '
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
                sh "scp -r ./frontend/*  ubuntu@52.14.253.15:/var/www/html"

                sh 'cp nodejs.pp /etc/puppet/code/environments/testing/manifests'
                sh "scp -r ./backend  ubuntu@52.14.253.15:/home/ubuntu"


                sh "ssh -n -f ubuntu@52.14.253.15 'sudo puppet agent --environment=testing --test' "
                
                


                sh 'cp production.pp /etc/puppet/code/environments/production/manifests'
                sh "ssh -n -f ubuntu@18.191.5.45 'sudo puppet agent --environment=production --test' "
                sh "scp -r ./frontend/*  ubuntu@18.191.5.45:/var/www/html"
            }
        }
    }
}