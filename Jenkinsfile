#!groovy

node('base') {
  stage 'Checkout - pull git repo' {
    currentBuild.displayName="Checkout"
    checkout scm
  }

  stage 'Build - build image' {
    currentBuild.displayName="Build"
    sh "docker build -t quay.io/prsn/jenkins:slave --no-cache=true --pull=true ."
  }

  stage 'Test - clair scan' {
    currentBuild.displayName="Test"
  }

  stage 'Accept - approve image' {
    currentBuild.displayName="Accept"
    input 'Image Acceptable?'
  }

  stage 'Publish - push image' {
    currentBuild.displayName="Publish"
    sh "docker push quay.io/prsn/jenkins:slave"
  }

}


