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

ENV JENKINS_HOME=/home/jenkins_home \
    DOCKER_API_VERSION=1.23 \
    SLAVE_VERSION=2.62

RUN useradd -d "$JENKINS_HOME" -u 1000 -m -s /bin/bash jenkins \
    && echo "jenkins  ALL=(ALL)  NOPASSWD: ALL" >> /etc/sudoers \
    && mkdir -p /home/jenkins_home/.jenkins \
    && chown -R jenkins:jenkins /home/jenkins_home \
    && curl --create-dirs -sSLo /usr/share/jenkins/slave.jar https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${SLAVE_VERSION}/remoting-${SLAVE_VERSION}.jar \
    && chmod 755 /usr/share/jenkins \
    && chmod 644 /usr/share/jenkins/slave.jar 

COPY files/resolv.conf /etc/resolv.conf
COPY files/jenkins-slave /bin/jenkins-slave

RUN touch /var/run/docker.sock \
    && chown -R jenkins:jenkins /var/run/docker.sock \
    && curl -fsSL https://get.docker.com/ | sh \
    && usermod -aG docker jenkins \
    && chmod +x /bin/jenkins-slave

USER jenkins

VOLUME ["/home/jenkins_home/"]
WORKDIR /home/jenkins_home

ENTRYPOINT ["/bin/jenkins-slave"]
