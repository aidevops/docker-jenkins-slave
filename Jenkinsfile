#!groovy

node('base') {
  stage 'Checkout'
  checkout scm
  stage 'Build'
  sh 'kubectl get po'
}