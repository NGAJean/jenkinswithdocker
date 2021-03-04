FROM jenkins/jenkins:latest
LABEL maintainer="julien@mengin.fr"

USER root

RUN groupadd -g 999 docker
RUN usermod -aG docker jenkins

USER jenkins