#!groovy

stage 'Checkout - pull git repo'
node('base') {
  currentBuild.displayName="Checkout"
  checkout scm
}

stage 'Build - build image'
node('base') {
  currentBuild.displayName="Build"
  sh "docker build -t quay.io/prsn/jenkins:slave --no-cache=true --pull=true ."
}

// stage 'Push - push image'
// node('base') {
//  currentBuild.displayName="Push"
//  sh "docker push quay.io/prsn/jenkins:slave"
// }

