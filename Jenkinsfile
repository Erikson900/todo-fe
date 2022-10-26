pipeline {
    agent any

    stages {
        stage('Build stage') {
            steps {
              sh 'DOCKER_BUILDKIT=1 docker build -f Dockerfile-pipeline -t erikson900/todo-fe:latest --target builder .'
            }
        }
        stage('Test stage') {
            steps {
                 sh 'DOCKER_BUILDKIT=1 docker build -f Dockerfile-pipeline -t erikson900/todo-fe:latest --target test .'
            }
        }
        stage('Delivery stage') {
            steps {
                sh 'DOCKER_BUILDKIT=1 docker build -f Dockerfile-pipeline -t erikson900/todo-fe:latest --target delivery .'
            }
        }
          stage('Cleanup stage') {
            steps {
                sh 'docker system prune -y '
            }
        }
          stage('Push stage') {
            steps {
                sh 'docker push erikson900/todo-fe:latest '
            }
        }
    }
}
