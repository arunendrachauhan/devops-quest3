FROM tomcat:8
MAINTAINER arun
RUN echo hello World!
COPY target/myweb.war /usr/local/tomcat/webapps/
