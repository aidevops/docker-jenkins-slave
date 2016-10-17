#!groovy

node('base') {
  stage 'Checkout'
  checkout scm
  stage 'Build'
  env.DOCKER_HOST = "tcp://localhost:4243"
  sh "docker build -t test ."
}