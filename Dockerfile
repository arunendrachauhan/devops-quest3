FROM tomcat:8
MAINTAINER arun
RUN apt-get update -y
COPY /var/lib/jenkins/workspace/myTest/target/*.war /usr/local/tomcat/webapps/
