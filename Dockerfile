FROM centos:7

MAINTAINER AIDevOps

RUN yum update -y \
    && yum clean all \
    && yum install -y \
    git \
    wget \
    openssh-server \
    java-1.8.0-openjdk \
    sudo \
    && yum clean all 

ENV JENKINS_HOME /home/jenkins

RUN useradd -d "$JENKINS_HOME" -u 1000 -m -s /bin/bash jenkins
RUN echo "jenkins  ALL=(ALL)  ALL" >> /etc/sudoers

RUN mkdir /home/jenkins/.ssh \
    && chown -R jenkins /home/jenkins \
    && chgrp -R jenkins /home/jenkins \
    && chmod 700 /home/jenkins/.ssh

ARG VERSION=2.62

RUN curl --create-dirs -sSLo /usr/share/jenkins/slave.jar https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${VERSION}/remoting-${VERSION}.jar \
    && chmod 755 /usr/share/jenkins \
    && chmod 644 /usr/share/jenkins/slave.jar

COPY files/resolv.conf /etc/resolv.conf

USER jenkins

RUN mkdir /home/jenkins/.jenkins
VOLUME /home/jenkins/.jenkins
WORKDIR /home/jenkins

COPY files/jenkins-slave /usr/local/bin/jenkins-slave

ENTRYPOINT ["jenkins-slave"]
