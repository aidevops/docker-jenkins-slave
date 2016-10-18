#!groovy

node('base') {
  stage 'Checkout'
  checkout scm
  stage 'Build'
  env.DOCKER_HOST = "tcp://localhost"
  sh "cat /etc/hosts"
  sh "docker build -t test ."
}