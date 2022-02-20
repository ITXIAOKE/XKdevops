FROM centos:7.5.1804
#创建程序目录
RUN mkdir /data/{node_export,newbee-mall} -p && mkdir /data/newbee-mall/upload/

#工具程序文件
COPY filebeat-7.6.0-x86_64.rpm /data
COPY node_exporter-1.0.1.linux-amd64.tar.gz /data

#安装环境工具
RUN yum -y install net-tools tzdata java-1.8.0-openjdk
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN rpm -ivh /data/filebeat-7.6.0-x86_64.rpm
RUN tar xf /data/node_exporter-1.0.1.linux-amd64.tar.gz -C /data/ && mv /data/node_exporter-1.0.1.linux-amd64 /data/node_exporter 
COPY run_node.sh /data/node_exporter/
RUN chmod a+x /data/node_exporter/run_node.sh
COPY functions /etc/rc.d/init.d/

#将程序封装到容器中
COPY newbee-mall-1.0.0-SNAPSHOT.jar /data/newbee-mall/
RUN mv /data/newbee-mall/newbee-mall-1.0.0-SNAPSHOT.jar /data/newbee-mall/newbee-mall.jar
COPY upload /data/newbee-mall/upload/ 

#启动文件
COPY entrypoint.sh  /data/
RUN chmod a+x /data/entrypoint.sh

EXPOSE 8080
EXPOSE 9100
ENTRYPOINT /data/entrypoint.sh
