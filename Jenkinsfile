pipeline {
  environment {
    callback = registerWebhook()
    callback_url = callback.getURL()
    docker_url= "https://hub.docker.com/api/build/v1/source/8c1f1bb1-9f2c-4057-9ad6-7054293b2375/trigger/35b2d246-27a4-4584-9293-212ce29970a5/call/" 
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
          // Call a remote system to start execution, passing a callback url
          sh "curl -X POST -H 'Content-Type: application/json' -d '{\"callback\":\"${callback_url}\"}' ${docker_url}"

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
