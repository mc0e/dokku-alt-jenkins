FROM ubuntu:trusty
MAINTAINER Kamil Trzciński <ayufan@ayufan.eu>

RUN apt-get update -y
RUN apt-get install -y openjdk-7-jre-headless
RUN apt-get install -y wget
RUN apt-get install -y git-core

RUN adduser --home /jenkins --disabled-login --gecos 'Jenkins' jenkins
RUN wget -O /jenkins.war http://mirrors.jenkins-ci.org/war-stable/latest/jenkins.war

USER jenkins
ENV JENKINS_HOME /jenkins

# Start everything
CMD ["java", "-jar", "/jenkins.war", "--httpPort=8080", "--ajp13Port=-1", "--httpsPort=-1"]
EXPOSE 8080
