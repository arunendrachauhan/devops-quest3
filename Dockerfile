FROM ubuntu:16.04
MAINTAINER arun
RUN apt-get update -y
ADD target/myweb.war /root/
