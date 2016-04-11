###### QNIBng image
FROM qnib/terminal

ENV NGINX_LIST_ROOT=false

RUN dnf install -y nginx
RUN sed -i '/worker_processes.*/a daemon off;' /etc/nginx/nginx.conf
ADD etc/supervisord.d/nginx.ini /etc/supervisord.d/nginx.ini
ADD opt/qnib/nginx/bin/start.sh /opt/qnib/nginx/bin/
ADD etc/consul.d/nginx.json /etc/consul.d/
ADD etc/nginx/nginx.conf /etc/nginx/
ADD etc/nginx/conf.d/default.conf /etc/nginx/conf.d/
ADD etc/nginx/default.d/root.conf /etc/nginx/default.d/
ADD opt/qnib/nginx/etc/list_root.conf  /opt/qnib/nginx/etc/
