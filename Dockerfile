# FROM tomcat:8.0-alpine
# LABEL maintainer="jyoti"
# to automate tomcat configurations
# COPY sample.war /usr/local/tomcat/webapps/
# COPY tomcat-users.xml /usr/local/tomcat/conf/
# COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/
# EXPOSE 8080
# CMD ["catalina.sh", "run"]


FROM jenkins/jenkins:lts
MAINTAINER jyoti96singh
USER root
WORKDIR /opt
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && apt-get install -y apt-utils && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs
RUN wget https://www-eu.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
RUN mkdir /opt/maven
RUN tar -zxvf apache-maven-3.6.3-bin.tar.gz -C /opt/
WORKDIR /opt
COPY settings.xml /opt/maven/apache-maven-3.6.3/conf/
EXPOSE 8080
