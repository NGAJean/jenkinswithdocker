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
    stage("github => pending") {
        steps {
            githubNotify status: "PENDING", credentialsId: "github-NGAJean", account: "NGAJean", repo: "jenkinswithdocker"
        }
    }    
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
            if ( "${env.BRANCH_NAME}" == 'master' ) {
              docker.withRegistry( '', registryCredential ) {
                dockerImage.push("${env.BUILD_NUMBER}")
              }
              echo "Push new image OK => ${env.BUILD_NUMBER}"
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
            if ( "${env.BRANCH_NAME}" == 'master' ) {
              docker.withRegistry( '', registryCredential ) {
                dockerImage.push("latest")
              }
              echo 'Push new image OK => latest'
            }            
            else {
              echo 'Not branch master, nothing to do'
            }            
          }            
       }
    }
  }
  post {
    success {
      slackSend channel: "#cicd", color: "good", message: "${env.JOB_NAME} ${env.BUILD_NUMBER} has result success"
      githubNotify status: "SUCCESS", credentialsId: "github-NGAJean", account: "NGAJean", repo: "jenkinswithdocker"
    }
    failure {
      slackSend channel: "#cicd", color: "danger", message: "${env.JOB_NAME} ${env.BUILD_NUMBER} has result failed"
      githubNotify status: "FAILURE", credentialsId: "github-NGAJean", account: "NGAJean", repo: "jenkinswithdocker"
    }
  }
}
