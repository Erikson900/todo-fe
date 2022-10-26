pipeline {
    agent any

    stages {
        stage('Build stage') {
            steps {
              sh 'DOCKER_BUILDKIT=1 docker build -f Dockerfile-pipeline -t erikson900/todo-fe:v${BUILD_NUMBER} --target builder .'
            }
        }
        stage('Test stage') {
            steps {
                 sh 'DOCKER_BUILDKIT=1 docker build -f Dockerfile-pipeline -t erikson900/todo-fe:v${BUILD_NUMBER} --target test .'
            }
        }
        stage('Delivery stage') {
            steps {
                sh 'DOCKER_BUILDKIT=1 docker build -f Dockerfile-pipeline -t erikson900/todo-fe:v${BUILD_NUMBER} --target delivery .'
            }
        }
        stage('Cleanup stage') {
            steps {
                sh 'yes | docker system prune '
            }
        }
       stage('PUSH STAGE') {
          steps {
               sh '''
                docker tag erikson900/todo-fe erikson900/todo-fe:jenkins-${BUILD_NUMBER}
                docker login -u ${username} -p ${password}
                docker push erikson900/todo-fe --all-tags
                '''
        }
    }
}
