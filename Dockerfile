###### QNIBng image
FROM qnib/terminal:cos7

RUN yum install -y nginx
RUN sed -i '/worker_processes.*/a daemon off;' /etc/nginx/nginx.conf
ADD etc/supervisord.d/nginx.ini /etc/supervisord.d/nginx.ini
ADD opt/qnib/bin/start_nginx.sh /opt/qnib/bin/start_nginx.sh
# php
RUN yum install -y php-fpm
ADD etc/nginx/nginx.conf /etc/nginx/
ADD etc/supervisord.d/php-fpm.ini /etc/supervisord.d/
