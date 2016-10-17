#!groovy

node('base') {
  stage 'Checkout'
  checkout scm
  stage 'Build'
  def docker = tool name: '', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
  sh "${docker} build -t test ."
}