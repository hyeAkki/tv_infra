FROM hiakki/php-fpm_on_alpine
ADD VERSION .
MAINTAINER Akshay Gupta
LABEL maintainer="hy.akshay@gmail.com"

COPY ./app /usr/app
COPY ./conf /etc/php7/php-fpm.d/

RUN chmod 777 -R /usr/app

WORKDIR /usr/app