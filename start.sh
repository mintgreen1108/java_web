#!/bin/bash

export JAVA_HOME=/usr/local/opt/jdk8/
export PATH=$JAVA_HOME/bin:$PATH

sh /usr/local/opt/tomcat/bin/catalina.sh run
