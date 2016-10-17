#!groovy

node('base') {
  stage 'Checkout'
  checkout scm
  stage 'Build'
  env.DOCKER_HOST = "unix:///var/run/docker.sock"
  sh "docker images"
}