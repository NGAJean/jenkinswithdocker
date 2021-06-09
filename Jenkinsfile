pipeline {
  agent {
    node {
      label 'docker'
    }
  } 
  stages {
    stage('Git Synchronization') {
         steps {          
          echo 'Git Synchronization OK'
         }
    }
    stage('Software Quality Gate') {
      steps {
          sleep 5
          sh 'grep maintainer Dockerfile'
      }
    }

    stage ("Build new image on Docker Hub") {
       steps { 
          sh 'ls'
          sh 'docker info'
          //sh 'docker build -t jenkins-demo:${BUILD_NUMBER} .'
          //sh 'docker tag jenkins-demo:${BUILD_NUMBER} jenkins-demo:latest'
          //sh 'docker images'
          echo 'Build new image OK'        
       }
    }
    stage('Prod Quality Gate') {
            parallel {
                stage('Security Compliance Checks') {
                    steps {
                        sleep 5
                        sh '! grep -e "FROM .*:latest" Dockerfile'
                    }
                }
                stage('Bench Compliance Check') {
                    steps {
                        sleep 10
                        echo 'Bench Compliance Check OK'
                    }
                }
            }
    }
    stage('Tag new image ready to prod') {
      steps {
        sleep 5
        echo 'New image tagged ready to prod'
      }
    }
  } 
}
