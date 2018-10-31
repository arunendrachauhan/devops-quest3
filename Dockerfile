FROM centos:7
MAINTAINER arun
RUN yum update -y
ADD target/myweb.war /root/
