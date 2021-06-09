FROM jenkins/jenkins:2.297-jdk11

LABEL maintainer="julien@mengin.fr"

USER root

RUN groupadd -g 999 docker
RUN usermod -aG docker jenkins

USER jenkins
