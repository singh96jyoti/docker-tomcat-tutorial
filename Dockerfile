FROM tomcat:8.0-alpine
LABEL maintainer="jyoti"

# COPY sample.war /usr/local/tomcat/webapps/

# to automate tomcat configurations
WORKDIR /opt
RUN apt-get update -y
RUN apt-get upgrade -y
COPY tomcat-users.xml /usr/local/tomcat/conf/
COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/

EXPOSE 8080
CMD ["catalina.sh", "run"]
