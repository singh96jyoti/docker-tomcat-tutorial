FROM tomcat:8.0-alpine
LABEL maintainer="jyoti"

# COPY sample.war /usr/local/tomcat/webapps/

# to automate tomcat configurations
COPY tomcat-users.xml /usr/local/tomcat/conf/
COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/

EXPOSE 8080
CMD ["catalina.sh", "run"]
