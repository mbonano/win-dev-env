FROM centos:latest
MAINTAINER Mark Bonano "mark@chazmar.com"

#####################################################################################
## Uncomment the following in order to configure http proxy env variables, used by  #
## applications.                                                                    #
#####################################################################################
# ENV HTTP_PROXY http://proxy.mydomain.com:80/
# ENV HTTPS_PROXY http://proxy.mydomain.com:80/
# ENV NO_PROXY localhost,127.0.0.1,.example.com
# ENV http_proxy http://proxy.mydomain.com:80/
# ENV https_proxy http://proxy.mydomain.com:80/
# ENV no_proxy localhost,127.0.0.1,.example.com

#####################################################################################
## Uncomment the following in order to configure yum to make use of an http proxy.  #
#####################################################################################
#RUN echo 'proxy=http://proxy.mydomain.com:80' | tee -a /etc/yum.conf
#RUN echo 'proxy_username=<PROXY_USER_NAME>' | tee -a /etc/yum.conf
#RUN echo 'proxy_password=<PROXY_PASSWORD>' | tee -a /etc/yum.conf

########################################################################################
## Uncomment the following in order to install proxy SSL certificates. You must first  #
## create a folder named 'proxy_certs' and add all SSL certs that should be installed. #
########################################################################################
# RUN yum update -y
# RUN yum install -y ca-certificates
# RUN update-ca-trust force-enable
# ADD ./proxy_certs /etc/pki/ca-trust/source/anchors
# RUN update-ca-trust extract

# install core os dependencies
RUN yum -y update && yum -y groupinstall 'Development Tools' && yum -y install \
    kernel-devel \
    ImageMagick-devel \
    bzip2-devel \
    libcurl \
    libcurl-devel \
    openssl-devel \
    libevent-devel \
    libffi-devel \
    glib2-devel \
    libjpeg-devel \
    mysql-devel \
    postgresql-devel \
    ncurses-devel \
    readline \
    readline-devel \
    sqlite-devel \
    openssl \
    openssl-devel \
    libxml2-devel \
    libxslt-devel \
    zlib-devel \
    libyaml-devel \
    sliteq-devel \
    wget \
    && yum clean all

RUN yum -y update && yum install -y \
    nano \
    net-tools \
    curl \
    wget \
    which \
    tar \
    && yum clean all
