#!groovy

node('base') {
  stage 'Checkout'
  checkout scm
  stage 'Build'
  env.DOCKER_HOST = "tcp://dockerhost"
  sh "cat /etc/hosts"
  sh "docker build -t test ."
}