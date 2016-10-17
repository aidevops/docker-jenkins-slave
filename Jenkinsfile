#!groovy

node('base') {
  stage 'Checkout'
  checkout scm
  stage 'Build'
  env.DOCKER_HOST = "tcp://127.0.0.1:2375"
  sh "docker ps -a"
  sh "docker build -t test ."
  sh "docker images"
}