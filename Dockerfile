FROM tomcat:8
MAINTAINER arun
RUN apt-get update -y
ADD target/myweb.war /usr/local/tomcat/webapps/
