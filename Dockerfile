FROM ubuntu:trusty
MAINTAINER Kamil Trzciński <ayufan@ayufan.eu>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_PRIORITY critical
ENV DEBCONF_NOWARNINGS yes

RUN apt-get update \
    && apt-get upgrade -y
RUN apt-get install -y \
    tzdata-java \
    openjdk-7-jre-headless \
    wget \
    git-core \
    fakeroot

RUN adduser --home /jenkins --disabled-login --gecos 'Jenkins' jenkins

RUN wget -O /jenkins.war http://mirrors.jenkins-ci.org/war-stable/latest/jenkins.war

USER jenkins
ENV JENKINS_HOME /jenkins

# Start everything
CMD ["java", "-jar", "/jenkins.war", "--httpPort=8080", "--ajp13Port=-1", "--httpsPort=-1"]
EXPOSE 8080
