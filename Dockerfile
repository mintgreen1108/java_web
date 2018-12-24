FROM centos:latest

RUN yum install -y wget
RUN yum install -y vim

RUN mkdir -p /usr/local/opt


# install jdk
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz
RUN tar -zxvf jdk-8u191-linux-x64.tar.gz
RUN mv jdk1.8.0_191 /usr/local/opt/jdk8
RUN rm -rf jdk-8u191-linux-x64.tar.gz
RUN rm -rf jdk1.8.0_191

#install tomcat
RUN wget http://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-8/v8.5.37/bin/apache-tomcat-8.5.37.tar.gz
RUN tar -zxvf apache-tomcat-8.5.37.tar.gz
RUN mv apache-tomcat-8.5.37 /usr/local/opt/tomcat
RUN rm -rf apache-tomcat-8.5.37.tar.gz
RUN rm -rf apache-tomcat-8.5.37

EXPOSE 8080

ENV HOME /root

ADD start.sh /start.sh
RUN chmod 755 /start.sh

CMD ["/start.sh"]
