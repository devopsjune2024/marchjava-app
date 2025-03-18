pipeline {
    agent any
    environment {
        PATH = "/opt/maven/bin:$PATH"
    }
    // tools {
    //     maven 'maven3.8'
    // }
    stages {
        stage('Git-CLonce/Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/devopsjune2024/marchjava-app.git'
            }
        }
        stage('Maven-Package') {
            steps {
                sh 'mvn package'
            }
        } 
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
    }
}

