#!groovy

node('base') {
  stage 'Checkout'
  checkout scm
  stage 'Build'
  sh "docker build -t test ."
}