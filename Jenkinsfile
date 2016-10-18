#!groovy

node('base') {
  stage('Checkout') {
    currentBuild.displayName="Checkout"
    checkout scm
  }

  stage('Build') {
    currentBuild.displayName="Build"
    sh "docker build -t quay.io/prsn/jenkins:slave --no-cache=true --pull=true ."
  }

  stage('Test') {
    currentBuild.displayName="Test"
  }

  stage('Accept') {
    currentBuild.displayName="Accept"
    input 'Image Acceptable?'
  }

  stage('Publish') {
    currentBuild.displayName="Publish"
    // sh "docker push quay.io/prsn/jenkins:slave"
  }

}


