#!groovy

node('base') {
  stage 'Checkout'
  checkout scm
  stage 'Build'
  sh "docker ps -a"
}