FROM jenkins/jenkins:2.382-jdk17
LABEL maintainer="julien@mengin.fr"
# Switch to elevated user to perform actions
USER root
# Retrieve new lists of packages
RUN /bin/sh -c apt-get update
# Upgrade all installed packages
RUN /bin/sh -c apt-get upgrade -y
# Allow Jenkins to communicate with docker daemon
RUN groupadd -g 999 docker && usermod -aG docker jenkins
# Install plugins
COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
# Drop back to the regular jenkins user
USER jenkins
