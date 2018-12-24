FROM centos:latest

RUN yum install wget

RUN mkdir -p /usr/local/opt

ENV HOME /usr/local/opt


# install jdk
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz
RUN tar -zxvf jdk-8u191-linux-x64.tar.gz
RUN mv jdk-8u191-linux-x64 jdk8
RUN rm -rf jdk-8u191-linux-x64.tar.gz

#install tomcat
RUN wget http://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-8/v8.5.37/bin/apache-tomcat-8.5.37.tar.gz
RUN tar -zxvf apache-tomcat-8.5.37.tar.gz
RUN mv apache-tomcat-8.5.37 apache
RUN rm -rf apache-tomcat-8.5.37.tar.gz

ADD start.sh /start.sh
RUN chmod 755 /start.sh

CMD ["/start.sh"]
