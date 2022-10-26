          stage('Push stage') {
            steps {
                sh 'docker push erikson900/todo-fe:latest '
            }
        }
