FROM ubuntu:16.04
MAINTAINER arunS
RUN apt-get update -y
ADD target/myweb.war /root/
