pipeline {
  environment {
     callback_url = registerWebhook()
  }  
  agent {
    node {
      label 'master'
    }
  } 
  stages {
    stage('Build new image on Docker Hub') {
         
         steps {
           echo "${callback_url}"
         }
    }
    stage('Test new image') {
      steps {
        echo 'Make some tests'
      }
    }
    stage('Tag new image ready to prod') {
      steps {
        echo 'Tag new image ready to prod'
      }
    }
  } 
}
