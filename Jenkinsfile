pipeline {
  environment {
      registry = "ngajean/jenkins-docker"
      registryCredential = 'b2c37527-3467-4561-b586-f155ed841656'
      dockerImage = ''
  }

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
          script {
            dockerImage = docker.build registry + ":$BUILD_NUMBER"
          }
          sh 'docker tag ngajean/jenkins-docker:${BUILD_NUMBER} ngajean/jenkins-docker:latest'
          script {
            docker.withRegistry( '', registryCredential ) {
              dockerImage.push()
            }
          }
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
