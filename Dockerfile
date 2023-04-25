FROM    redhat/ubi9
RUN     yum install httpd vim unzip -y
add     https://www.free-css.com/assets/files/free-css-templates/download/page290/cryptop.zip /var/www/html
WORKDIR /var/www/html
RUN     unzip cryptop.zip
RUN     rm -rf cryptop.zip
RUN     mv cryptop-html/* .
RUN     rm -rf cryptop-html
EXPOSE  80
CMD     ["/usr/sbin/httpd","-DFOREGROUND"]

