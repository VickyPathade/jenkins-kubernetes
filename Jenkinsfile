pipeline {
    agent any

    tools {
        maven "maven 3.9.5"
    }

    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/VickyPathade/jenkins-kubernetes.git'
            }
        }

        stage('Maven Build') {
            steps {
                sh "mvn clean package"
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'apt-get update'
                    sh 'apt-get install -y docker.io'
                    sh 'docker build -t vicky2580/javawebapp .'
                }
            }
        }

      

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh 'kubectl apply -f pod.yml'
                }
            }
        }
    }
}
