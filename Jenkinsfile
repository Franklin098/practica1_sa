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
                sh "scp -r ./frontend/*  ubuntu@3.134.80.197:/home/ubuntu"
                sh "ssh -n -f ubuntu@3.134.80.197 'sudo cp /home/ubuntu/html /var/www/html' "    
            }
        }
    }
}