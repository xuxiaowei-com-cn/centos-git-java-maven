FROM centos:centos7.9.2009

ADD v2.35.1.tar.gz /usr/lib/
ADD apache-maven-3.6.3-bin.tar.gz /usr/lib/
ADD Alibaba_Dragonwell_8.9.10_x64_linux.tar.gz /usr/lib/

# git 安装
RUN yum -y install make gcc openssl-devel curl-devel expat-devel zlib-devel gettext-devel
WORKDIR /usr/lib/git-2.35.1
RUN ls
RUN make
RUN make install
WORKDIR /
RUN ls
RUN git --version

# java & maven 环境变量
ENV JAVA_HOME /usr/lib/jdk8u312-b01
ENV JRE_HOME $JAVA_HOME/jre
ENV CLASSPATH .:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib

ENV M2_HOME /usr/lib/apache-maven-3.6.3

ENV PATH $JAVA_HOME/bin:$JRE_HOME/bin:$M2_HOME/bin:$PATH

# 软链接
RUN ln -s /usr/lib/jdk8u312-b01/bin/java /usr/bin/java
RUN ln -s /usr/lib/apache-maven-3.6.3/bin/mvn /usr/bin/mvn

RUN java -version
RUN mvn -version
