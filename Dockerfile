###### QNIBng image
FROM qnib/terminal:fd22

###
RUN dnf install -y make luajit-devel pcre-devel zlib-devel && \
    curl -Lsf http://nginx.org/download/nginx-1.9.5.tar.gz|tar xzf - -C /opt/ && \
    curl -Lsf https://github.com/openresty/lua-nginx-module/archive/v0.9.17rc1.tar.gz | tar xfz - -C /opt/ && \
    cd /opt/nginx-1.9.5/ && \
    ./configure --prefix=/usr/ --add-module=/opt/lua-nginx-module-0.9.17rc1 && \
    make -j2 && make install
###

ADD etc/nginx/nginx.conf etc/nginx/mime.types /etc/nginx/
ADD etc/supervisord.d/nginx.ini /etc/supervisord.d/nginx.ini
ADD opt/qnib/bin/start_nginx.sh /opt/qnib/bin/start_nginx.sh
ADD etc/consul.d/nginx.json /etc/consul.d/
