pipeline {
    agent any
    environment {
        KUBECONFIG = "${HOME}/.kube/config"
    }
    tools {
        maven "maven 3.9.5"
    }
    stages {
        stage('Hello') {
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
