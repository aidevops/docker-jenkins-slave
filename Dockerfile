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

RUN /usr/bin/ssh-keygen -A

# Set SSH Configuration to allow remote logins without /proc write access
RUN sed -ri 's/^session\s+required\s+pam_loginuid.so$/session optional pam_loginuid.so/' /etc/pam.d/sshd

RUN useradd jenkins -m -s /bin/bash
RUN echo "jenkins  ALL=(ALL)  ALL" >> etc/sudoers

RUN mkdir /home/jenkins/.ssh
COPY files/authorized_keys /home/jenkins/.ssh/authorized_keys
RUN chown -R jenkins /home/jenkins
RUN chgrp -R jenkins /home/jenkins
RUN chmod 600 /home/jenkins/.ssh/authorized_keys
RUN chmod 700 /home/jenkins/.ssh

COPY files/resolv.conf /etc/resolv.conf

EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]

