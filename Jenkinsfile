#!groovy

node('base') {
  stage 'Checkout'
  checkout scm
  stage 'Build'
  env.DOCKER_HOST = "unix:///var/run/docker.sock"
  sh "docker ps -a"
  sh "docker build -t test ."
  sh "docker images"
}