pipeline {
   environment {
     callback_object = registerWebhook('DockerHub')
     callback_url = callback_object.getURL()
     docker_url= "https://hub.docker.com/api/build/v1/source/c73d69d4-5266-4e69-a401-645a72d81071/trigger/ba4173ba-a22c-4adb-a966-d676987c53dd/call/" 
   }
  agent {
    node {
      label 'master'
    }
  } 
  stages {
    stage('Build new image on Docker Hub') {
         steps {          
          // Call a remote system to start execution, passing a callback url
          //sh "curl -X POST -H 'Content-Type: application/json' -d '{\"callback\":\"${callback_url}\"}' ${docker_url}"           
          sh "curl -X POST -H 'Content-Type: application/json' ${docker_url}"           
         }
    }
    stage ("Long Running Stage") {
       steps { 
        // Block and wait for the remote system to callback
        //waitForWebhook $callback_object
        echo 'Make some tests'
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
