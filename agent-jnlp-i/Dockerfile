FROM centos:centos7.5.1804

#准备yum源,安装docker、jdk、maven等必要软件
RUN rm -rf /etc/yum.repos.d/* && curl -o /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo ;curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo && yum -y install git curl tar bash vim  net-tools

#安装docker
RUN curl -o /etc/yum.repos.d/docker-ce.repo https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo && yum -y install --setopt=obsoletes=0 docker-ce-19.03.0-3.el7

#安装maven jdk
COPY jdk1.8.tar.gz /usr/local
COPY apache-maven-3.3.9.tar /usr/local/
RUN tar xf /usr/local/jdk1.8.tar.gz -C /usr/local/ && tar xf /usr/local/apache-maven-3.3.9.tar -C /usr/local/ && echo -e "export JAVA_HOME=/usr/local/jdk1.8.0_131 \nexport MVN_HOME=/usr/local/apache-maven-3.3.9 \nexport PATH=\$PATH:\$JAVA_HOME/bin:\$MVN_HOME/bin" >> /etc/profile && echo "source /etc/profile" >> ~/.bashrc
COPY settings.xml /usr/local/apache-maven-3.3.9/conf/settings.xml

#准备kubectl认证文件目录
RUN mkdir /root/.kube

#将kubectl认证文件上传到容器里对应的目录
RUN /root/.kube
COPY config /root/.kube

#将kubectl目录上传至容器
COPY kubectl /usr/local/bin
RUN chmod a+x /usr/local/bin/kubectl

#部署tomcat
RUN mkdir /data/soft -p
COPY apache-tomcat-8.5.12.tar.gz /data/soft
RUN tar xf /data/soft/apache-tomcat-8.5.12.tar.gz -C /data && mv /data/apache-tomcat-8.5.12 /data/tomcat && rm -rf /data/tomcat/webapps/*
COPY catalina.sh /data/tomcat/bin/catalina.sh

#拷贝启动脚本和host文件
COPY hosts /tmp/hosts
COPY entrypoint.sh /data/

#设置中文字符集
RUN yum install -y kde-l10n-Chinese glibc-common && localedef -c -f UTF-8 -i zh_CN zh_CN.utf8
ENV LC_ALL zh_CN.UTF-8
#容器的启动命令
ENTRYPOINT ["/bin/bash","/data/entrypoint.sh"]
