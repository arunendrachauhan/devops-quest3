FROM tomcat:8
MAINTAINER arun
RUN apt-get update -y
RUN mkdir /usr/local/tomcat/webapps/test
COPY target/myweb-0.0.1.war /usr/local/tomcat/webapps/myweb-0.0.1.war
