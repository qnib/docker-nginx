###### QNIBng image
FROM qnib/supervisor
MAINTAINER "Christian Kniep <christian@qnib.org>"

RUN yum install -y nginx
RUN sed -i '/worker_processes.*/a daemon off;' /etc/nginx/nginx.conf
ADD etc/supervisord.d/nginx.ini /etc/supervisord.d/nginx.ini
ADD opt/qnib/bin/start_nginx.sh /opt/qnib/bin/start_nginx.sh
