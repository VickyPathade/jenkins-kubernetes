pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git credentialsId: 'git', url: 'https://github.com/VickyPathade/jenkins-kubernetes'
            }
        }
        stage('Maven Build') {
            steps {
                def mavenHome = tool name: "Maven-3.9.5", type: "maven"
                def mavenCMD = "${mavenHome}/bin/mvn"
                sh "${mavenCMD} clean package"
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
