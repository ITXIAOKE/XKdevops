FROM centos:7.5.1804
RUN mkdir /data/
COPY nginx-1.16.1.tar.gz /data
RUN yum -y install net-tools tzdata openssl openssl-devel zlib-devel zlib pcre pcre-devel gcc-c++
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN tar xf /data/nginx-1.16.1.tar.gz -C /data && cd /data/nginx-1.16.1 && ./configure --prefix=/data/nginx --with-http_ssl_module --with-http_stub_status_module && make && make install
RUN rm -rf /data/nginx-1.16.1* && mkdir /data/nginx/conf/conf.d/
COPY nginx.conf /data/nginx/conf/
COPY default.conf /data/nginx/conf/conf.d/
COPY entrypoint.sh /data/
RUN chmod a+x /data/entrypoint.sh
EXPOSE 80
EXPOSE 443
ENTRYPOINT /data/entrypoint.sh
