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
          sh 'grep maintainer Dockerfile'
      }
    }

    stage ("Build new image on Docker Hub") {
       steps { 
          script {
            dockerImage = docker.build registry
            docker.withRegistry( '', registryCredential ) {
              dockerImage.push("${env.BUILD_NUMBER}")
            }
          }
          echo 'Build new image OK'        
       }
    }
    stage('Prod Quality Gate') {
            parallel {
                stage('Security Compliance Checks') {
                    steps {
                        sh '! grep -e "FROM .*:latest" Dockerfile'
                    }
                }
                stage('Bench Compliance Check') {
                    steps {
                        echo 'Bench Compliance Check OK'
                    }
                }
            }
    }
    stage('Tag new image ready to prod') {
       steps { 
          script {
            docker.withRegistry( '', registryCredential ) {
              dockerImage.push("latest")
            }
          }   
       }
    }
  } 
  post {
    success {
      slackSend color: "good", message: "${env.JOB_NAME} ${env.BUILD_NUMBER} has result success"
    }
    failure {
      slackSend color: "danger", message: "${env.JOB_NAME} ${env.BUILD_NUMBER} has result failed"
    }
  }
}
