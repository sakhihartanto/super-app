pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-cred')
    }

    stages {
        stage('Checkout Github') {
            steps {
                git branch: 'main', url: 'https://github.com/sakhihartanto/super-app.git'
            }
        }

        stage('Docker Compose Build Image') {
            steps {
                sh 'docker-compose build'
            }
        }

        stage('Docker Compose up Container') {
            steps {
                sh 'docker-compose up -d'
            }
        }

        stage('Curl the IP') {
            steps {
                // Ganti IP_ADDRESS dengan alamat IP yang ingin Anda curl
                sh 'curl 52.221.194.10'
            }
        }

        stage('Docker Compose Push to Docker Hub') {
            steps {
                withCredentials([
                    usernamePassword(credentialsId: DOCKERHUB_CREDENTIALS, passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')
                ]) {
                    sh 'echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin'
                    sh 'docker-compose push'
                }
            }
        }
    }
}
