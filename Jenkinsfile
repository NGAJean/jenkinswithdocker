pipeline {
  environment {
    callback = registerWebhook()
    callback_url = $callback.getURL()
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
           waitForWebhook $callback
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
