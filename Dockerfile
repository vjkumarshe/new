FROM centos:latest
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN  sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd vim unzip -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page290/cryptop.zip /var/www/html
WORKDIR /var/www/html
RUN systemctl restart httpd
RUN systemctl enable --now httpd
RUN unzip cryptop.zip
RUN rm -rf cryptop.zip
RUN cp -rf cryptop-html/* .
RUN rm -rf cryptop-html
EXPOSE 80
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
