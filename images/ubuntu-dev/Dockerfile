FROM ubuntu:latest
MAINTAINER Mark Bonano "mark@chazmar.com"

#########################################################################################
## Uncomment the following in order to configure apt-get to make use of an http proxy.  #
#########################################################################################
# RUN echo 'Acquire::http::proxy "http://proxy.mydomain.com:80";' | tee -a /etc/apt/apt.conf
# RUN echo 'Acquire::https::proxy "http://proxy.mydomain.com:80";' | tee -a /etc/apt/apt.conf

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

########################################################################################
## Uncomment the following in order to install proxy SSL certificates. You must first  #
## create a folder named 'proxy_certs' and add all SSL certs that should be installed. #
########################################################################################
# RUN apt-get update -y
# RUN apt-get install -y ca-certificates
# ADD ./proxy_certs /usr/local/share/ca-certificates
# RUN update-ca-certificates

# install common tools
RUN apt-get install -y nano net-tools curl 