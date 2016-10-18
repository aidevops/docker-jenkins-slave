#!groovy

stage 'Checkout - pull git repo'
node('base') {
  wrap([$class: 'AnsiColorBuildWrapper', 'colorMapName': 'XTerm', 'defaultFg': 1, 'defaultBg': 2]) {
    currentBuild.displayName="Checkout"
    checkout scm
  }
}

stage 'Build - build image'
node('base') {
  wrap([$class: 'AnsiColorBuildWrapper', 'colorMapName': 'XTerm', 'defaultFg': 1, 'defaultBg': 2]) {
    currentBuild.displayName="Build"
    sh "docker build -t quay.io/prsn/jenkins:slave --no-cache=true --pull=true ."
  }
}

// stage 'Push - push image'
// node('base') {
//   wrap([$class: 'AnsiColorBuildWrapper', 'colorMapName': 'XTerm', 'defaultFg': 1, 'defaultBg': 2]) {
//     currentBuild.displayName="Push"
//     sh "docker push quay.io/prsn/jenkins:slave"
//   }
// }

