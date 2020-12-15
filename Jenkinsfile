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
                dir('frontend'){
                    sh 'cp -a . /var/www/html'  
                }
            }
        }
    }
}