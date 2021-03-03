pipeline {
  agent {
    node {
      label 'master'
    }
  } 
  stages {
    stage('Build new image on Docker Hub') {
      steps {
         hook = registerWebhook()
      }
      steps {
          echo "Waiting for POST to ${hook.getURL()}"
      }
      steps {
          data = waitForWebhook hook
      }
      steps {
          echo "Webhook called with data: ${data}"       
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
