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
                sh "scp -r ./frontend/*  ubuntu@52.14.253.15:/home/"
                sh "ssh -n -f ubuntu@52.14.253.15 'chef-client' "    
            }
        }
    }
}