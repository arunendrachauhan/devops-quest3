FROM tomcat:8
MAINTAINER arun
COPY target/myweb.war /usr/local/tomcat/webapps/
