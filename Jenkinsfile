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
                sh 'cp production.pp /etc/puppet/code/environments/production/manifests'
                sh "ssh -n -f ubuntu@3.134.86.78 'sudo agent --environment-production --test' "
            }
        }
    }
}