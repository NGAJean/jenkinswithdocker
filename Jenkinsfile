pipeline {
  agent {
    node {
      label 'master'
    }
  } 
  stages {
    stage('Build new image on Docker Hub') {
      steps {
         echo "Waiting for build"
          callback_url = registerWebhook()

          // Call a remote system to start execution, passing a callback url
          sh "curl -X POST -H 'Content-Type: application/json' -d '{\"callback\":\"${callback_url}"}' http://localhost/post"

          // Block and wait for the remote system to callback
          waitForWebhook callback_url        
        
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
