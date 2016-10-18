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
}


